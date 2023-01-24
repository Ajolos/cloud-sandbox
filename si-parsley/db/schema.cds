namespace pl.sic.parsley;
using { managed } from '@sap/cds/common';

entity Employees: managed {
    key ID: UUID @(Core.Computed: true);
    firstName: String(50);
    lastName: String(50);
    dateOfBirth: Date;
    emailAddress: String(100);
}