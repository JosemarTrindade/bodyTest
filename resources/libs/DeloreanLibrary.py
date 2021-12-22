import psycopg2
from logging import info

class DeloreanLibrary():

    def connect(self):
        return psycopg2.connect(
            host='ec2-34-232-191-133.compute-1.amazonaws.com',
            database='d1balojp1kjpt7', 
            user='dozidysfnjhznl',
            password='a978a703a0a58be1fe0d30ef16e9d2c5d8b1c51c22a02088f67766cc998b60e3'
        )

    # No Robot vira uma KW automaticamente => Remove Student        email@desejado.com
    def remove_student(self, email):

        query = "delete from students where email = '{}'".format(email)
        info(query)

        conn = self.connect()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()

    def remove_student_by_name(self, name):

        query = "delete from students where name LIKE '%{}%'".format(name)
        info(query)

        conn = self.connect()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()    

    def insert_student(self, student):

        self.remove_student(student['email'])

        query=("insert into students (name, email, age, weight, feet_tall, created_at, updated_at)"
                "values('{}','{}',{},{},{},NOW(),NOW());"
                .format(student['name'],student['email'],student['age'],student['weight'],student['feet_tall']))      
        info(query)

        conn = self.connect()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()

    def remove_plan_by_title(self, title):

        query = "delete from plans where title LIKE '%{}%'".format(title)
        info(query)

        conn = self.connect()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close() 

    def insert_plan(self, plan):

        self.remove_plan_by_title(plan['title'])

        query=("insert into plans (title, duration, price, created_at, updated_at)"
                "values('{}',{},{},NOW(),NOW());"
                .format(plan['title'],plan['duration'],plan['price']))
        info(query)

        conn = self.connect()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()