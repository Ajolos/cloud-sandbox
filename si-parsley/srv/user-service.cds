using { pl.sic.parsley as my } from '../db/schema';

@path: 'service/userService'
service UserService {
    @requires: 'authenticated-user'
    entity Employees as projection on my.Employees {
        emailAddress,
        firstName,
        lastName,
        dateOfBirth,
        hireDate,
        description,
        position,
        firstName || ' ' || lastName as fullName: String(100),
        Department.Manager.firstName || ' ' || Department.Manager.lastName as supervisor: String(50),
        Average.Average as rating,
        Comments,
        Department
       
    } actions {
        action createComment( rating: Integer, content: String )
    };
    entity Departments as projection on my.Departments;
    entity Comments as projection on my.Comments {
        *,
        Sender.firstName || ' ' || Sender.lastName as author: String(50),
        value as rating,
    };
}

annotate UserService.Employees with @(
    Common.SemanticKey: [emailAddress],
    Capabilities: {
        Deletable: false
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
    emailAddress @(
        title: '{i18n>Employees.EmailAddress}',
        UI.ExcludeFromNavigationContext,
        Common.SemanticObject: 'Employees'
    );
    firstName @(
        title : '{i18n>Employees.FirstName}',
        UI.ExcludeFromNavigationContext
    );
    lastName @(
        title: '{i18n>Employees.LastName}',
        UI.ExcludeFromNavigationContext
    );
    fullName @(
        title: '{i18n>Employees.FullName}',
        UI.ExcludeFromNavigationContext
    );
    position @(
        title: '{i18n>Employees.Position}',
        UI.ExcludeFromNavigationContext
    );
    dateOfBirth @(
        title: '{i18n>Employees.DateOfBirth}',
        UI.ExcludeFromNavigationContext
    );
    hireDate @(
        title: '{i18n>Employees.HireDate}',
        UI.ExcludeFromNavigationContext
    );
    supervisor @(
        title: '{i18n>Employees.Manager}',
        UI.ExcludeFromNavigationContext
    );
    rating @(
        title: '{i18n>Employees.Rating}',
        UI.ExcludeFromNavigationContext
        );
    description @(
        title: '{i18n>Employees.Description}',
        UI.MultiLineText,
        UI.ExcludeFromNavigationContext
    );
}

annotate UserService.Comments with @(
    UI.PresentationVariant: {
        RequestAtLeast: [Sender_emailAddress]
    },
    Capabilities: {
        Deletable: false,
        Insertable: true
    }
){
    content @title: '{i18n>Comments.content}';
    author @title: '{i18n>Comments.author}';
    rating @title: '{i18n>Comments.rating}';
}

annotate UserService.createComment with @(
    Common.SideEffects: {
        TargetProperties: [
            _it.Comments
        ]
    }
);

annotate UserService.Departments with @(
    Common.SemanticKey: [ID],
    UI: {
        PresentationVariant  : {
            $Type : 'UI.PresentationVariantType',
            RequestAtLeast : [
              ID  
            ],            
        },
    }
){
    ID @(
        title: '{i18n>Departments.Department}',
        Common: {
            Text : departmentName,
            TextArrangement : #TextOnly,
            SemanticObject : 'Departments',
        }
    );
    departmentName @(
        UI.ExcludeFromNavigationContext,
        title: '{i18n>Employees.Department}'
    );
};
