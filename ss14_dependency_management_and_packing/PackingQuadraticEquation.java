package ss14_dependency_management_and_packing;

import java.util.Scanner;

public class PackingQuadraticEquation {
    public static void main(String[] args) {
        // vui lòng nhập vào số a b c
        Scanner scanner = new Scanner(System.in);

        System.out.println("Nhập số a");
        int a = Integer.parseInt(scanner.nextLine());
        System.out.println("Nhập số b");
        int b = Integer.parseInt(scanner.nextLine());
        System.out.println("Nhập số c");
        int c = Integer.parseInt(scanner.nextLine());
        quadraticEquation(a,b,c);
    }
    public static void quadraticEquation(int a, int b, int c){
        // kiểm tra hệ số
        if (a == 0){
            if (b == 0){
                System.out.println("Phương Trình Vô Nghiệm");
            } else {
                System.out.println("Phương Trình Có 1 Nghiệm" + " x = " + (-c / b) );
            }
        }

        // tính delta
        double delta = b*b - 4 * a * c ;
        double x1;
        double x2;

        // tính nghiệm
        if (delta > 0){
            x1 = ((-b + Math.sqrt(delta)) / (2 * a));
            x2 = ((-b - Math.sqrt(delta)) / (2 * a));
            System.out.println("Phương Trình Có 2 nghiệm" + " x1 = " + x1 + "và " + "x2 = " + x2);
        } else if (delta == 0) {
            x1 = -b / (2*a);
            System.out.println("Phương Trình Có Nghiệm Kép là " +  " x = " + x1);
        } else {
            System.out.println("Phương Trình Vô Nghiệm");
        }
    }
}
