using { pl.sic.parsley as my } from '../db/schema';

@path: 'service/userService'
service UserService {
    entity Employees as projection on my.Employees {
        emailAddress,
        firstName,
        lastName,
        dateOfBirth,
        hireDate,
        description,
        position,
        firstName || ' ' || lastName as fullName: String(100),
        Department.departmentName as departmentName,
        Department.Manager.firstName || ' ' || Department.Manager.lastName as supervisor: String(50),
        Average.Average as rating,
        Comments,
        Department
    };
    entity Departments as projection on my.Departments;
    entity Comments as projection on my.Comments {
        *,
        Sender.firstName || ' ' || Sender.lastName as author: String(50),
        value as rating,
    };
}

annotate UserService.Employees with @(
    Capabilities: {
        Deletable: false,
        Insertable: false
    },
    UI: {
        HeaderInfo  : {
            Title : {
                Value: fullName
            },
            TypeName: '{i18n>Employees.TypeName}',
            TypeNamePlural: '{i18n>Employees.TypeNamePlural}'
        },
    }
){
    emailAddress @title: '{i18n>Employees.EmailAddress}';
    firstName @title : '{i18n>Employees.FirstName}';
    lastName @title: '{i18n>Employees.LastName}';
    fullName @title: '{i18n>Employees.FullName}';
    position @title: '{i18n>Employees.Position}';
    dateOfBirth @title: '{i18n>Employees.DateOfBirth}';
    hireDate @title: '{i18n>Employees.HireDate}';
    departmentName @(
        title: '{i18n>Employees.Department}',
        Common.ValueListWithFixedValues: true,
        Common.ValueList: {
            CollectionPath: 'Departments',
            Parameters: [
                {
                    $Type: 'Common.ValueListParameterInOut',
                    LocalDataProperty : 'departmentName',
                    ValueListProperty: 'departmentName'
                }
            ]
        }
    );
    supervisor @title: '{i18n>Employees.Manager}';
    rating @title: '{i18n>Employees.Rating}';
    description @(
        title: '{i18n>Employees.Description}',
        UI.MultiLineText
    );
}

annotate UserService.Comments with {
    content @title: '{i18n>Comments.content}';
    author @title: '{i18n>Comments.author}';
    rating @title: '{i18n>Comments.rating}';
}

