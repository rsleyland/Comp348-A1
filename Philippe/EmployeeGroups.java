import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.Scanner;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class EmployeeGroups {

    public static void main(String[] args) {

        new BigDecimal("asd");

        Employee[] employees = null;
        String srcFile = "";

        try (Scanner scanner = new Scanner(System.in)) {
            System.out.print("Which file would you like to process: ");
            srcFile = scanner.next();
        }

        try (Stream<String> stream = Files.lines(Paths.get(srcFile))) {
            employees = stream
                    .map(Employee::parse)
                    .toArray(Employee[]::new);
        } catch (IOException e) {
            e.printStackTrace();
        }

        assert employees != null;

        System.out.println("----Display employees by last name and first name----");
        Arrays.stream(employees)
                .sorted((e1, e2) -> e1.getName().compareTo(e2.getName()))
                .forEach(System.out::println);

        System.out.println();
        System.out.println("----Display employees by id----");
        Arrays.stream(employees)
                .sorted((e1, e2) -> e1.getId().compareTo(e2.getId()))
                .forEach(System.out::println);

        System.out.println();
        System.out.println("----Salary Statistics----");
        Arrays.stream(employees).collect(
                Collectors.groupingBy(
                        Employee::getSalaryRange,
                        Collectors.summarizingDouble(x -> x.getSalary().doubleValue())
                ))
                .forEach((x, y) -> System.out.println(
                        "Range: " + x + "." +
                        "\nStatistics:" +
                        "\n\tcount: " + y.getCount() +
                        "\n\tAverage Salary: " + String.format("%.2f", y.getAverage())
                ));
        
        System.out.println();
        System.out.println("----Employees Statistics----");
        Arrays.stream(employees).collect(
                Collectors.groupingBy(
                        Employee::getClass,
                        Collectors.summarizingDouble(x -> x.getSalary().doubleValue())
                ))
                .forEach((x, y) -> System.out.println(
                        "Range: " + x + "." +
                                "\nStatistics:" +
                                "\n\tcount: " + y.getCount() +
                                "\n\tAverage Salary: " + String.format("%.2f", y.getAverage())
                ));
    }
}
