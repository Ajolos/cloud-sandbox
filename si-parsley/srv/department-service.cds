using { pl.sic.parsley as my } from '../db/schema';

@path: 'service/departmentService'
service DepartmentService {
    entity Department as projection on my.Departments {
        *,
        Manager.firstName || ' ' || Manager.lastName as supervisor: String(50),
        SupDepartment.departmentName as supDepartmentName,
        SupDepartment.description as supDescription,
        SupDepartment.Manager.firstName || ' ' || SupDepartment.Manager.lastName as supSupervisor: String(50),
    };
    entity Employees as projection on my.Employees;
}
