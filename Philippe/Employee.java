import java.math.BigDecimal;

public class Employee implements Person {

    private final String salary;
    private final String id;
    private final String firstName;
    private final String lastName;
    public enum salaryRanges {
        LESS25000,
        BETWEEN25000_40000,
        BETWEEN40000_70000,
        OVER70000
    }

    public Employee(String salary, String id, String firstName, String lastName) {
        this.salary = salary;
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public static Employee parse(String info) {
        String[] data = info.split(",");
        return new Employee(data[3], data[0], data[1], data[2]);
    }

    public BigDecimal getSalary() {
        BigDecimal salary = null;
        try {
            salary = new BigDecimal(this.salary);
        } catch (NumberFormatException e) {
            System.out.println("Please enter a valid salary");
            System.exit(1);
        }

        return salary;
    }

    public salaryRanges getSalaryRange() {
        BigDecimal salary = getSalary();
        if (salary.compareTo(BigDecimal.valueOf(25_000)) < 0)
            return salaryRanges.LESS25000;
        else if (salary.compareTo(BigDecimal.valueOf(40_000)) < 0)
            return salaryRanges.BETWEEN25000_40000;
        else if (salary.compareTo(BigDecimal.valueOf(70_000)) < 0)
            return salaryRanges.BETWEEN40000_70000;
        else
            return salaryRanges.OVER70000;
    }

    @Override
    public String getId() {
        return id;
    }

    @Override
    public String getName() {
        return firstName + " " + lastName;
    }

    @Override
    public String toString() {
        return (id + "," + firstName + "," + lastName + "," + salary);
    }
}
