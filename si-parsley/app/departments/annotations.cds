using DepartmentService as service from '../../srv/department-service';

annotate service.Department with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'departmentName',
            Value : departmentName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'description',
            Value : description,
        },
        /*
        {
            $Type : 'UI.DataField',
            Label : 'Manager_emailAddress',
            Value : Manager_emailAddress,
        },
        */
        {
            $Type : 'UI.DataField',
            Label : 'supervisor',
            Value : supervisor,
        },
        {
            $Type : 'UI.DataField',
            Label : 'supDepartmentName',
            Value : supDepartmentName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'supDescription',
            Value : supDescription,
        }, 
        {
            $Type : 'UI.DataField',
            Label : 'supSupervisor',
            Value : supSupervisor,
        },                  
    ]
);
annotate service.Department with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'departmentName',
                Value : departmentName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'description',
                Value : description,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Manager_emailAddress',
                Value : Manager_emailAddress,
            },
            {
                $Type : 'UI.DataField',
                Label : 'supervisor',
                Value : supervisor,
            },
            {
                $Type : 'UI.DataField',
                Label : 'supDepartmentName',
                Value : supDepartmentName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'supDescription',
                Value : supDescription,
            },
            {
                $Type : 'UI.DataField',
                Label : 'supSupervisor',
                Value : supSupervisor,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
       {
            $Type : 'UI.ReferenceFacet',
            Target : 'Employees/@UI.LineItem',
            Label : 'Employees',
        }        
    ]
);

annotate service.Employees with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Label : 'firstName',
            Value : firstName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'lastName',
            Value : lastName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'dateOfBirth',
            Value : dateOfBirth,
        },
        {
            $Type : 'UI.DataField',
            Label : 'hireDate',
            Value : hireDate,
        },
    ],
);