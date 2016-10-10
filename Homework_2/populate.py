import psycopg2
import os
import random
import string
import datetime
import time


def cursorize(func):
    def func_wrapper(conn, *args):
        cursor = conn.cursor()
        func(cursor, *args)
        conn.commit()
        cursor.close()
    return func_wrapper

def strTimeProp(start, end, format, prop):
    """
    from: http://stackoverflow.com/questions/553303/generate-a-random-date-between-two-other-dates
    """

    stime = time.mktime(time.strptime(start, format))
    etime = time.mktime(time.strptime(end, format))

    ptime = stime + prop * (etime - stime)

    return time.strftime(format, time.localtime(ptime))

def randomDate(start, end, prop):
    """
    from: http://stackoverflow.com/questions/553303/generate-a-random-date-between-two-other-dates
    """
    return strTimeProp(start, end, '%Y-%m-%d %H:%M:%S', prop)


@cursorize
def create_position(cursor):
    timestamp = randomDate("2016-01-01 00:00:00", "2017-01-01 00:00:00", random.random())
    lat = (random.random() * 180) - 90 #value between -90 and 90
    lon = (random.random() * 360) - 180 #value between -180 and 180
    alt = random.random() * 10000
    cursor.execute(str.format("INSERT INTO Position(timestamp, lat, lon, alt) VALUES ('{}', {}, {}, {});", timestamp, lat, lon, alt))


if __name__ == "__main__":
    os.system("./create_schema.sh")
    conn = psycopg2.connect("dbname=homework2 user=markus password=markus")

    for _ in range(100000):
        create_position(conn)

    conn.close()
