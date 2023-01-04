package furama.servlet;

import furama.model.facility.House;
import furama.model.facility.Room;
import furama.model.facility.Facility;
import furama.model.facility.Villa;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "FacilityServlet", value = "/facility")
public class FacilityServlet extends HttpServlet {
    private static List<Villa> villaList = new ArrayList<>();
    private static List<House> houseList = new ArrayList<>();
    private static List<Room> roomList = new ArrayList<>();

    static {
        villaList.add(new Villa("Villa1", "50m", "25000", "25", "2/1/2023-5/1/2023"
                , "Diamond", "dieu hoa", "2m", "2"));
    }



    static {
        roomList.add(new Room("Room1", "20m", "15000", "4", "2/1/2023", "xe dap"));
    }



    static {
        houseList.add(new House("House1", "40m", "20000", "20", "2/1/2023", "gold", "ti-vi", "2"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("villaList", villaList);
        request.setAttribute("houseList", houseList);
        request.setAttribute("roomList", roomList);
        request.getRequestDispatcher("view/list_facility.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
