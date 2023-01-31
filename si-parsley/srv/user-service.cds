using { pl.sic.parsley as my } from '../db/schema';

@path: 'service/userService'
service UserService {
    entity Employees as projection on my.Employees {
        *,
        Department.departmentName as departmentName,
        Department.Manager.firstName || ' ' || Department.Manager.lastName as supervisor: String(50),
        Average.Average as rank,
    };
    entity Departments as projection on my.Departments;
    entity Comments as projection on my.Comments;
}