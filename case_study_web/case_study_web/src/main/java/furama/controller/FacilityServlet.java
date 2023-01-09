package furama.controller;



import furama.model.facility.Facility;
import furama.service.IFacilityService;
import furama.service.impl.FacilityService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

import java.util.List;


@WebServlet(name = "FacilityServlet", value = "/facility")
public class FacilityServlet extends HttpServlet {
    private IFacilityService facilityService = new FacilityService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            default:
                showListFacility(request, response);
                break;
        }

    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action){
            case "add":
                addFacility(request,response);
                break;
            case "delete":
                deleteFacility(request,response);
                break;
        }

    }

    private void deleteFacility(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean check = facilityService.delete(id);
        String mess = "Delete Facility Success";
        if (!check){
            mess = "Not Delete Facility Success";
        }
        request.setAttribute("mess",mess);
        showListFacility(request,response);
    }

    private void addFacility(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int max_people = Integer.parseInt(request.getParameter("max_people"));
        String standard_room = request.getParameter("standard_room");
        String description_other_convenience = request.getParameter("description_other_convenience");
        double pool_area = Double.parseDouble(request.getParameter("pool_area"));
        int number_of_floors = Integer.parseInt(request.getParameter("number_of_floors"));
        String facility_free = request.getParameter("facility_free");
        int rent_type = Integer.parseInt(request.getParameter("rent_type"));
        int facility_type = Integer.parseInt(request.getParameter("facility_type"));
        Facility facility = new Facility(name,area,cost,max_people,standard_room,description_other_convenience,
                pool_area,number_of_floors,facility_free,rent_type,facility_type);
         boolean check = facilityService.add(facility);
         String mess = "Add Facility Success";
         if(!check){
             mess = "Not Add Facility Success";
         }
         request.setAttribute("mess",mess);
         showListFacility(request,response);

    }

    private void showListFacility(HttpServletRequest request, HttpServletResponse response) {
        List<Facility> facilityList = facilityService.findAll();
        request.setAttribute("facilityList",facilityList);
        try {
            request.getRequestDispatcher("view/facility/list_facility.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
