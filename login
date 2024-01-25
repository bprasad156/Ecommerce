package com.example.ecommerce;

import java.sql.ResultSet;

public class Login {

public  Customer customerLogin(String UserName,String Password){
    String query="select* from customer where  email='"+UserName+"'AND password='"+Password+"'";
    DbConnection connection=new DbConnection();
    try{
        ResultSet re= connection.getQueryTable(query);
        if(re.next()) {
            return new Customer( re.getInt("Id") ,re.getString("name"), re.getString("email"), re.getString("mobile"));
        }
    }
    catch (Exception e){
        e.printStackTrace();

    }
    return  null;

}

    public static void main(String[] args) {
        Login login=new Login();


       Customer customer=login.customerLogin("balasalaprasad1234@gmail.com","B.prasad12");

        if (customer != null) {
            System.out.println("Welcome:"+customer.getName());

        } else {
            System.out.println("Login failed. Please check your username and password.");
        }
    }
}
