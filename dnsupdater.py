import time
import urllib.request
	
def update():
    key = '';
    return urllib.request.urlopen('http://codedns.codealfa.hu/update?key=' + key).read().decode('utf-8')

if __name__ == '__main__':
    i = 300	
    while True:
        try:
            i = int(update().split('\n',1)[0].strip())
            if not (60 <= i <= 3600):
                i = 300
        except:
            pass
        time.sleep(i)
