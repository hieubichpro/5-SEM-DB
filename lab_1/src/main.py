from faker import *
import random 

iterations = 1000

def generateFootballerTable():
    faker = Faker()
    with open('../docs/footballer.csv', 'w') as f:
        for i in range (iterations):
            first_name     = faker.first_name()
            last_name      = faker.last_name()
            age            = random.randint(16, 45)
            country        = faker.country()
            salary         = random.randint(10, 1000) * 10000
            phone_number   = faker.phone_number()

            line = "{0},{1},{2},{3},{4},{5}\n".format(
                first_name, last_name, age, country, salary, phone_number)
        
            f.write(line)

    print("Footballer table was created\n")

def generateCoachTable():
    faker = Faker()
    with open('../docs/coach.csv', 'w') as f:
        for i in range (iterations):
            first_name      = faker.first_name()
            last_name       = faker.last_name()
            age             = random.randint(30, 79)
            country         = faker.country()
            work_experience = random.randint(0, age - 30)
            phone_number    = faker.phone_number()
            salary          = random.randint(50, 500) * 10000
            email           = faker.email()

            line = "{0},{1},{2},{3},{4},{5},{6},{7}\n".format(
                first_name, last_name, age, country, work_experience, phone_number,salary, email)
        
            f.write(line)

    print("Coach table was created\n")
    

def generateClubTable():
    faker = Faker()
    prefixes = ['Real', 'Atletico', 'Norwichm', 'Spartak', 'Dynamo', 'Wigan', 'WestHam', 'Arsenal', 'Borussia', 'Bayern']
    postfix  = ['United', 'City', 'Hotspur', 'Inter', 'Villa', 'Rovers', 'Athletic', 'Palace', 'Town', 'Forest', 'Madrid']
    name_list = ['_']
    
    with open('../docs/club.csv', 'w') as f:
        for i in range (iterations):
            city            = faker.city()
            country         = faker.country()
            num_of_fans     = random.randint(10, 1000) * 1234
            email           = faker.unique.email()
            founding_year = random.randint(1830, 2023)

            name = '_'
            if random.randint(0, 1):
                name = random.choice(prefixes)  + ' ' + faker.last_name() 
            else:
                name = faker.last_name() + ' ' + random.choice(postfix)
            
            name_list.append(name)

            line = "{0},{1},{2},{3},{4},{5}\n".format(
                name, city, country, num_of_fans, email, founding_year)
            
            f.write(line)

    print("Club table was created \n")

def generateMarketTable():
    end = iterations + 1
    positionList = ['GK', 'LB', 'CB', 'RB', 'CDM', 'RM', 'LM', 'CAM', 'LW', 'RW', 'ST']
    list_1 = [i for i in range(1, end)]
    list_2 = [i for i in range(1, end)]
    list_3 = [i for i in range(1, end)]
    with open('../docs/transfer.csv', 'w') as f:
        for i in range(iterations):
            footballer_id = random.choice(list_1)
            coach_id      = random.choice(list_2)
            club_id       = random.choice(list_3)
            num_of_goals   = random.randint(5, 500)
            rating         = round(random.uniform(1, 5), 1)

            list_1.remove(footballer_id)
            list_2.remove(coach_id)
            list_3.remove(club_id)

            cost = random.randint(10, 100) * 123
            position = random.choice(positionList)
            line = "{0},{1},{2},{3},{4},{5},{6}\n".format(
                cost, position, num_of_goals, rating, footballer_id, coach_id, club_id)

            f.write(line)

    print("TransferMarket table was created\n")


if __name__ == "__main__":

    # db = FootballDB()
    # db.delete_tables()
    # db.create_tables()

    generateFootballerTable()
    generateCoachTable()
    generateClubTable()
    generateMarketTable()

    # db.copy_data()
