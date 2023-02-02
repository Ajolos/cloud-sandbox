namespace pl.sic.parsley;
using { managed } from '@sap/cds/common';

entity Employees: managed {
    key emailAddress: String(100) @(Core.Immutable: true);
    firstName: String(50);
    lastName: String(50);
    dateOfBirth: Date;    
    hireDate: Date;
    description: String;
    position: String;
    Department: Association to one Departments;
    Comments: Association to many Comments on Comments.Receiver = $self;
    Average: Association to one AggrComment on Average.Receiver = $self;
}


entity Departments: managed {
    key ID: UUID  @(Core.Computed: true);
    departmentName: String(40);
    description: String;
    Manager: Association to one Employees;
    SupDepartment: Association to one Departments;
    Employees: Association to many Employees on Employees.Department = $self; 
}

entity Comments: managed {
    key ID: UUID @(Core.Computed: true);
    content: String;
    value: Integer;
    Sender: Association to one Employees;
    Receiver: Association to one Employees;
}

entity AggrComment as select from Comments {
    key Receiver as Receiver,
    avg(Comments.value) as Average: Double
} group by Receiver;


