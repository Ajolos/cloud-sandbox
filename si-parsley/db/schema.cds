namespace pl.sic.parsley;
using { managed } from '@sap/cds/common';

entity Employees: managed {
    key ID: UUID @(Core.Computed: true);
    firstName: String(50);
    lastName: String(50);
    dateOfBirth: Date;
    emailAddress: String(100);
    isManager: Boolean;
    supervisor: Association to one Employees;
    Comments: Composition of many Comments on Comments.target=$self;
}

entity Comments: managed {
    key ID: UUID @(Core.Computed: true);
    target: Association to Employees;
    author: Association to Employees;
    content: String;
}