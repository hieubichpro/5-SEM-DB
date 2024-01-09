def read_footballer():
    footballers = []
    id = 1
    with open("/home/hieubich/DB/lab_7/csv/footballer.csv", "r") as f:
        for line in f:
            line_data = line.split(',')
            line_data[2] = int(line_data[2])
            line_data[4] = int(line_data[4])
            line_data[5] = line_data[5][:-1]
            footballers.append({'id':id, 'f_name':line_data[0], 'l_name':line_data[1], 'age':line_data[2], 'country':line_data[3], 'salary':line_data[4], 'phone':line_data[5]})
            id += 1
    return footballers

# def read_coach():
#     coaches = []
#     with open("/home/hieubich/DB/lab_7/csv/coach.csv", "r") as f:
#         for line in f:
#             line_data = line.split(',')
#             line_data[2] = int(line_data[2])
#             line_data[4] = int(line_data[4])
#             line_data[6] = int(line_data[4])
#             line_data[7] = line_data[7][:-1]
#             coaches.append(line_data)
#     return coaches

def read_club():
    clubs = []
    id = 1
    with open("/home/hieubich/DB/lab_7/csv/club.csv", "r") as f:
        for line in f:
            line_data = line.split(',')
            line_data[3] = int(line_data[3])
            line_data[5] = int(line_data[5][:-1])
            clubs.append({'id':id, 'name':line_data[0], 'city':line_data[1], 'country':line_data[2], 'fans':line_data[3], 'email':line_data[4], 'year':line_data[5]})
            id += 1
    return clubs

def read_transfer():
    transfers = []
    id = 1
    with open("/home/hieubich/DB/lab_7/csv/transfer.csv", "r") as f:
        for line in f:
            line_data = line.split(',')
            line_data[0] = int(line_data[0])
            line_data[2] = int(line_data[2])
            line_data[3] = float(line_data[3])
            line_data[4] = int(line_data[4])
            line_data[5] = int(line_data[5])
            line_data[6] = int(line_data[6][:-1])
            transfers.append({'id':id, 'cost':line_data[0], 'pos':line_data[1], 'goals':line_data[2], 'rating':line_data[3], 'id_footballer':line_data[4], 'id_club':line_data[6]})
            id += 1
    return transfers
