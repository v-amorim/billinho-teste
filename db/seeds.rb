Student.create(name: 'Vinicius', cpf: '12345678907', birth: '07/03/1998', gender: 'M', payment: 'Boleto')
Student.create(name: 'Amorim', cpf: '78945612307', birth: '03/07/2008', gender: 'M', payment: 'Cartao')
Student.create(name: 'Cristina', cpf: '32165498705', birth: '05/02/2000', gender: 'F', payment: 'Boleto')
Student.create(name: 'Joao', cpf: '55544466699', birth: '24/05/1942', gender: 'M', payment: 'Boleto')

Institution.create(name: 'Cruzeiro do Sul', cnpj: '12345678912345', i_type: 'Universidade')
Institution.create(name: 'Prisma', cnpj: '789456123456', i_type: 'Creche')
Institution.create(name: 'UNIP', cnpj: '66644466644466', i_type: 'Universidade')
Institution.create(name: 'ETEC Jacarei', cnpj: '11122244455566', i_type: 'Escola')

Enrollment.create(student_id: 1, institution_id: 1, amount: 7200, quantity_bill: 6, due_day: 30, course: 'Engenharia')
Enrollment.create(student_id: 2, institution_id: 3, amount: 5200, quantity_bill: 6, due_day: 28, course: 'Enfermagem')
Enrollment.create(student_id: 3, institution_id: 4, amount: 15_200, quantity_bill: 6, due_day: 10, course: 'Medicina')
Enrollment.create(student_id: 4, institution_id: 2, amount: 7200, quantity_bill: 6, due_day: 12, course: 'Ensino Fundamental')