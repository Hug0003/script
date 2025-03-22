import pymysql
connexion = pymysql.connect(host='62.4.30.230',   
                            port=3306,
                            user='web',
                            passwd='sKKeo_G/B)XtLty]',
                            db='web',
                            autocommit=True)
curseur = connexion.cursor()