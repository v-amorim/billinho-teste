Student.create(name: 'William Rodrigues Dias', cpf: '22434566208', birth: '10/02/2001', gender: 'M', payment: 'Boleto')
Student.create(name: 'Mário Carlos Siqueira', cpf: '12235459749', birth: '21/10/2002', gender: 'M', payment: 'Cartao')
Student.create(name: 'Fabiana Rúbens Cursino', cpf: '12415136806', birth: '25/02/1997', gender: 'F', payment: 'Boleto')
Student.create(name: 'Joao de Paula César', cpf: '13125156876', birth: '22/08/2010', gender: 'M', payment: 'Boleto')

Institution.create(name: 'UNITAU', cnpj: '76454678000189', i_type: 'Universidade')
Institution.create(name: 'Cultural', cnpj: '23532547000156', i_type: 'Creche')
Institution.create(name: 'UNIP', cnpj: '55324645000157', i_type: 'Universidade')
Institution.create(name: 'Universal', cnpj: '12523646000267', i_type: 'Escola')

Enrollment.create(student_id: 1, institution_id: 1, amount: 7200, quantity_bill: 6, due_day: 30, course: 'Engenharia')
Enrollment.create(student_id: 2, institution_id: 3, amount: 5200, quantity_bill: 6, due_day: 28, course: 'Enfermagem')
Enrollment.create(student_id: 3, institution_id: 4, amount: 15_200, quantity_bill: 6, due_day: 10, course: 'Medicina')
Enrollment.create(student_id: 4, institution_id: 2, amount: 7200, quantity_bill: 6, due_day: 12,
                    course: 'Ensino Fundamental')