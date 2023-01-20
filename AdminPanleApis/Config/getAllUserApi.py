import pymysql
from app import app
from config import mysql
from flask import jsonify
from flask import flash, request

# @app.route('/create', methods=['POST'])
# def create_emp():
#     try:        
#         _json = request.json
#         _name = _json['name']
#         _email = _json['email']
#         _phone = _json['phone']
#         _address = _json['address']	
#         if _name and _email and _phone and _address and request.method == 'POST':
#             conn = mysql.connect()
#             cursor = conn.cursor(pymysql.cursors.DictCursor)		
#             sqlQuery = "INSERT INTO emp(name, email, phone, address) VALUES(%s, %s, %s, %s)"
#             bindData = (_name, _email, _phone, _address)            
#             cursor.execute(sqlQuery, bindData)
#             conn.commit()
#             respone = jsonify('Employee added successfully!')
#             respone.status_code = 200
#             return respone
#         else:
#             return showMessage()
#     except Exception as e:
#         print(e)
#     finally:
#         cursor.close() 
#         conn.close()          
#################################
#####       USERS       #########
#################################  
@app.route('/allUsers')
def users():
    try:
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        cursor.execute("SELECT * FROM user")
        allUsers = cursor.fetchall()
        if(allUsers):
            respone = jsonify({'code':1,'message':"Successfull",'response':allUsers})
            respone.status_code = 200
        else:
            respone = jsonify({'code':0,'message':"No data Found","response":[]})
        return respone
    except Exception as e:
        print(e)
    finally:
        cursor.close() 
        conn.close()  

@app.route('/allUsers/<int:id_user>')
def user_details(id_user):
    try:
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        print(id_user)
        cursor.execute("SELECT * FROM user WHERE id_user = %s", id_user)
        oneUser = cursor.fetchone()
        if(oneUser):
            respone = jsonify({'code':1,'message':"Successfull",'response':oneUser})
            respone.status_code = 200
        else:
            respone = jsonify({'code':0,'message':"No data Found","response":[]})
        return respone
    except Exception as e:
        print(e)
    finally:
        cursor.close() 
        conn.close() 



#################################
#####       MEDIC       #########
#################################


@app.route('/allMedicine')
def medicine():
    try:
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        cursor.execute("SELECT * FROM product")
        allMedicienList = cursor.fetchall()
        respone = jsonify({'code':1,'message':"Successfull",'response':allMedicienList})
        respone.status_code = 200
        return respone
    except Exception as e:
        respone = jsonify({'code':0,'message':"No data Found",'response':allMedicienList})
        print(e)
    finally:
        cursor.close() 
        conn.close()  



@app.route('/allMedicine/<int:id_product>')
def medicine_details(id_product):
    try:
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        print(id_product)
        cursor.execute("SELECT * FROM product WHERE id_product = %s", id_product)
        medicienAt = cursor.fetchone()
        if(medicienAt):
            respone = jsonify({'code':1,'message':"Successfull",'response':medicienAt})
            respone.status_code = 200
        else:
            respone = jsonify({'code':0,'message':"No data Found",'response':[]})
        return respone
    except Exception as e:
        print(e)
    finally:
        cursor.close() 
        conn.close() 




##################################################
###########           Order       ################
##################################################


@app.route('/allOrders')
def orders():
    try:
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        cursor.execute("SELECT * FROM order_details")
        allMedicienList = cursor.fetchall()
        respone = jsonify({'code':1,'message':"Successfull",'response':allMedicienList})
        respone.status_code = 200
        return respone
    except Exception as e:
        respone = jsonify({'code':0,'message':"No data Found",'response':allMedicienList})
        print(e)
    finally:
        cursor.close() 
        conn.close()  



@app.route('/allOrders/<int:invoice>')
def order_details(invoice):
    try:
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        print(invoice)
    
        # cursor.execute("SELECT * FROM order_details WHERE id_orders = %s", invoice)
        # cursor.execute("SELECT order_details.*, product.name,product.image FROM order_details JOIN product on order_details.id_product = product.id_product WHERE order_details.invoice = '%s' LIMIT 5",invoice)
        cursor.execute("SELECT a.*, b.name, b.image, c.status From order_details as a JOIN product as b ON a.id_product = b.id_product JOIN orders as c ON a.id_orders = c.id_orders WHERE a.invoice = '%s'",invoice)

        medicienAt = cursor.fetchall()
        if(medicienAt):
            respone = jsonify({'code':1,'message':"Successfull",'response':medicienAt})
            respone.status_code = 200
        else:
            respone = jsonify({'code':0,'message':"No data Found",'response':[]})
        return respone
    except Exception as e:
        print(e)
    finally:
        cursor.close() 
        conn.close() 





##################################################
##################################################
##################################################

@app.route('/updateMed', methods=['PUT'])
def update_med():
    try:
        _json = request.json
        _id = _json['id']
        _name = _json['name']
        _description = _json['description']
        _price = _json['price']
        _status = _json['status']
        if _name and _description and _price and _status and _id and request.method == 'PUT':			
            sqlQuery = "UPDATE product SET name=%s, description=%s, price=%s, status=%s WHERE id=%s"
            bindData = (_name, _description, _price, _status, _id,)
            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.execute(sqlQuery, bindData)
            conn.commit()
            respone = jsonify('Medicine updated successfully!')
            respone.status_code = 200
            return respone
        else:
            return showMessage()
    except Exception as e:
        print(e)
    finally:
        cursor.close() 
        conn.close() 

@app.route('/delete/', methods=['DELETE'])
def delete_med(id):
	try:
		conn = mysql.connect()
		cursor = conn.cursor()
		cursor.execute("DELETE FROM product WHERE id =%s", (id,))
		conn.commit()
		respone = jsonify('Employee deleted successfully!')
		respone.status_code = 200
		return respone
	except Exception as e:
		print(e)
	finally:
		cursor.close() 
		conn.close()
        
       
@app.errorhandler(404)
def showMessage(error=None):
    message = {
        'status': 404,
        'message': 'Record not Found: ' + request.url,
    }
    respone = jsonify(message)
    respone.status_code = 404
    return respone
        
if __name__ == "__main__":
    app.run()