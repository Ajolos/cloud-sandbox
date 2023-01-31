using UserService as UserService from '../../srv/user-service';

annotate UserService.Employees with @(
    UI.LineItem : [
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
        {
            $Type: 'UI.DataField',
            Label: 'department',
            Value: departmentName,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Manager',
            Value: supervisor
        }
    ]
);
annotate UserService.Employees with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'emailAddress',
                Value : emailAddress,
            },
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
            {
                $Type : 'UI.DataField',
                Label : 'description',
                Value : description,
            },
            {
                $Type : 'UI.DataField',
                Label : 'rank',
                Value : rank,
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
            Target : 'Comments/@UI.LineItem',
            Label : 'Comments',
        }
    ]
);

annotate UserService.Comments with @(
    UI.LineItem: [
        {
            $Type: 'UI.DataField',
            Label: 'CreatedAt',
            Value: createdAt,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Author',
            Value: Sender.lastName
        },
        {
            $Type: 'UI.DataField',
            Label: 'Content',
            Value: content,
        }
    ],
);