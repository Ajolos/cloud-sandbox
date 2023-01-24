using { pl.sic.parsley as my } from '../db/schema';

@path: 'service/userService'
service UserService {
    entity Employees as projection on my.Employees;
}