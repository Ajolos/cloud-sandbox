using UserService as UserService from '../../srv/user-service';

annotate UserService.Employees with @(
    Capabilities.InsertRestrictions: {
        Insertable: true
    },
    UI.DataPoint #Position: {
        Title: '{i18n>Position}',
        Value: position,
    },
    UI.DataPoint #Rating: {
        Title: '{i18n>Rating}',
        Value: rating,
        TargetValue : 5,
        Visualization : #Rating,
    },
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : firstName,
            ![@HTML5.CssDefaults]: { width: 'auto'},
        },
        {
            $Type : 'UI.DataField',
            Value : lastName,
            ![@HTML5.CssDefaults]: { width: 'auto'},
        },
        {
            $Type: 'UI.DataField',
            Value: position,
            ![@HTML5.CssDefaults]: { width: 'auto'},
        },
        {
            $Type: 'UI.DataField',
            Value: departmentName,
            ![@HTML5.CssDefaults]: { width: 'auto'},
        },
        {
            $Type: 'UI.DataField',
            Value: supervisor,
            ![@HTML5.CssDefaults]: { width: 'auto'},
        },
        {
            $Type : 'UI.DataField',
            Value : dateOfBirth,
            ![@HTML5.CssDefaults]: { width: 'auto'},
        },
        {
            $Type : 'UI.DataField',
            Value : hireDate,
            ![@HTML5.CssDefaults]: { width: 'auto'},
        }
    ],
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : emailAddress,
            },
            {
                $Type : 'UI.DataField',
                Value : dateOfBirth,
            },
            {
                $Type : 'UI.DataField',
                Value : hireDate,
            },
            // {
            //     $Type: 'UI.DataField',
            //     Value: depId
            // },
            // {
            //     $Type: 'UI.DataFieldWithIntentBasedNavigation',
            //     SemanticObject: 'departments',
            //     Action : 'list',
            //     Value: Department.ID
            // },
            {
                $Type: 'UI.DataFieldWithIntentBasedNavigation',
                SemanticObject: 'departments',
                Action : 'list',
                Value: depId,
                Mapping:[
                    {
                        LocalProperty: depId,
                        SemanticObjectProperty: 'ID'
                    }                    
                ]
            }
        ],
    },
    UI.HeaderFacets:[
        {
            $Type:'UI.ReferenceFacet',
            Target: '@UI.DataPoint#Position'
        },
        {
            $Type: 'UI.ReferenceFacet',
            Target: '@UI.DataPoint#Rating'
        }        
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : '{i18n>GeneralDataHeader}',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target : 'Comments/@UI.LineItem',
            Label : '{i18n>CommentsSection}',
        }
    ]
);

annotate UserService.Comments with @(
    UI.DataPoint #Rating: {
        Title: '{i18n>Rating}',
        Value: rating,
        TargetValue : 5,
        Visualization : #Rating,
    },
    Capabilities: {
        Deletable: false,
        Insertable: true
    },
    UI.LineItem: [
        {
            $Type: 'UI.DataField',
            Value: createdAt,
        },
        {
            $Type: 'UI.DataField',
            Value: author
        },
        {
            $Type: 'UI.DataFieldForAnnotation',
            Target : '@UI.DataPoint#Rating',
        },
        {
            $Type: 'UI.DataField',
            Value: content,
            ![@HTML5.CssDefaults]: { width: 'auto'},
        }
    ],
);