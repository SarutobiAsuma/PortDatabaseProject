# A minimal Mysql shell for experiments
import pymysql
# σημείωση να αντικατασταθεί με το socket file που ορίζεται στο config
sock =''
h = 'localhost'
while True:
    try:
        dbname = input("Βάση δεδομένων: ")
        con = pymysql.connect(host = h, unix_socket = sock, \
             user='root', passwd=None, db=dbname, charset='utf8')
    except pymysql.Error as e:
        print ('Σφάλμα', e)
    else:
        con.isolation_level = None
        cur = con.cursor()
        cur.execute('select version()')
        print('Εκδοση βάσης δεδομένων: {}'.format(cur.fetchone()))
        break
buffer = ""
print ("ΒΔ:", dbname, " Δώστε εντολές SQL (enter για έξοδο)")
while True:
    line = input('>>>')
    if line == "":
        print ("byeeeeeeeeeeeee")
        break
    buffer += line
    print (buffer)
    if True: 
        try:
            buffer = buffer.strip()
            if buffer.lstrip().upper().startswith("SELECT"):
                count=0
                cur.execute(buffer)
                desc = [x[0] for x in cur.description]
                print(*desc, sep='\t')
                for row in cur.fetchall():
                    for i in row :
                        print (i, end = '\t')
                    print()
                    count +=1
                    if count%30==0:
                        reply = input ( "....more ? (y/n)")
                        if reply != "y" :
                            break
                        else:
                            print ()
            else:
                cur.execute(buffer)
                cur.execute('commit')
            print ("σύνολο :", cur.rowcount )
        except pymysql.Error as e:
            print ("An error occurred:", e)
        buffer = ""
cur.execute('commit')        
con.close()
