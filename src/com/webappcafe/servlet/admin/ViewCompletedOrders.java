package com.webappcafe.servlet.admin;

import com.webappcafe.dao.*;
import com.webappcafe.model.Customer;
import com.webappcafe.model.Order;
import com.webappcafe.model.Product;
import com.webappcafe.model.ProductOrder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@WebServlet(name = "viewCompletedOrders", value = {"/viewCompletedOrders"})
public class ViewCompletedOrders extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        OrderDAO orderDAO = new OrderDAOImpl();

        ProductDAO productDAO = new ProductDAOImpl();

        ProductOrderDAO productOrderDAO = new ProductOrderDAOImpl();

        Map<Order, Customer> completedOrders = orderDAO.getCompletedOrders("complete");

        for (Map.Entry<Order, Customer> orderCustomerEntry : completedOrders.entrySet()) {

            List<Product> productList = productDAO.getProductsOfOrder(orderCustomerEntry.getKey().getId());

            List<ProductOrder> productOrderList = productOrderDAO.getProductsOrdersByOrderId(orderCustomerEntry.getKey().getId());

            Iterator<Product> productIterator = productList.iterator();
            Iterator<ProductOrder> productOrderIterator = productOrderList.iterator();

            List<String> productsOfOrder = new ArrayList<>();

            double totalPrice = 0;
            while (productIterator.hasNext() && productOrderIterator.hasNext()) {
                //creates products list of String
                Product product = productIterator.next();
                String productString = product.getName();
                productsOfOrder.add(productString);

                ProductOrder productOrder = productOrderIterator.next();
                totalPrice += (product.getPrice() * productOrder.getProductsQuantity());

            }

            orderCustomerEntry.getKey().setProductsOfOrder(productsOfOrder);
            orderCustomerEntry.getKey().setTotalPrice(totalPrice);

        }

        request.setAttribute("completedOrders", completedOrders);
        request.getRequestDispatcher("viewCompletedProducts.jsp").forward(request, response);
    }
}
