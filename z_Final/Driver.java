import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.DoubleSummaryStatistics;
import java.util.Map;
import java.util.Scanner;
import java.util.stream.Collectors;
import java.util.stream.Stream;


public class Driver1 {	
	
	public static void main(String[] args) {
		
		//arraylist to store parsed employees from file
		ArrayList<Person> people = new ArrayList<Person>();
		String inputFilePath = "";
		Scanner userInput = new Scanner(System.in);
		
		//User prompt for filename
		System.out.print("Welcome to CSV file parser\n--------------------------\nEnter filename: ");
		inputFilePath = userInput.nextLine();
		System.out.println("\nProcessing "+inputFilePath+"...\n");
		userInput.close();
		
		//try with resources, opens file, saves each line in file as line in stream, stream 'input' can then be parsed and each employee from csv added to arraylist people
		//try with resources will auto-close any resources declared in try block
		try (Stream<String> input = Files.lines(Paths.get(inputFilePath))) {
			input.forEach(i -> people.add((Employee.parse(i))));
		} catch (IOException e) {
			System.out.println("I/O error! Stream cannot be populated. Program will close.");
			System.exit(0);
		}
		
		//sort and print employees by First & Last names
		System.out.println("Employees ordered by First and Last Names:\n------------------------------------------");
		people.stream().sorted((o1,o2) -> { return o1.getName().compareTo(o2.getName());
		}).forEach(System.out::println);
		
		//sort and print employees by ID #
		System.out.println("\nEmployees ordered by ID #:\n--------------------------");
		people.stream().sorted((o1, o2) -> o1.getId().compareToIgnoreCase(o2.getId())).forEach(System.out::println);
		
		//Sort into salary ranges, display information about each range (count and average salary of employees in each salary range)
		System.out.println("\nSummary Information of Salary ranges\n------------------------------------");
		//use of Map to group together employees into different range groups, uses Enum salaryRange for keys and salary stats in key value
		//Person objects are casted to Employees during map() in stream()
		Map<Employee.SalaryRange, DoubleSummaryStatistics> empsBySalary = people.stream().map(obj -> (Employee) obj).collect(Collectors.groupingBy(Employee::sortRange, Collectors.summarizingDouble(e -> e.getBigDecSalary().doubleValue())));
		if(empsBySalary.get(Employee.SalaryRange.less25)!=null)
			System.out.println("\t< $25,000 : Count = "+empsBySalary.get(Employee.SalaryRange.less25).getCount()+" & Average = $" + (int)empsBySalary.get(Employee.SalaryRange.less25).getAverage());
		if(empsBySalary.get(Employee.SalaryRange.from25to40)!=null)
			System.out.println("$25,000 - $39,999 : Count = "+empsBySalary.get(Employee.SalaryRange.from25to40).getCount()+" & Average = $" + (int)empsBySalary.get(Employee.SalaryRange.from25to40).getAverage());
		if(empsBySalary.get(Employee.SalaryRange.from40to70)!=null)
			System.out.println("$40,000 - $69,999 : Count = "+empsBySalary.get(Employee.SalaryRange.from40to70).getCount()+" & Average = $" + (int)empsBySalary.get(Employee.SalaryRange.from40to70).getAverage());
		if(empsBySalary.get(Employee.SalaryRange.more70)!=null)
			System.out.println("$70,000 <\t  : Count = "+empsBySalary.get(Employee.SalaryRange.more70).getCount()+" & Average = $" + (int)empsBySalary.get(Employee.SalaryRange.more70).getAverage());
				
		//Calculate and display total employee count & average of all employees salaries
		System.out.println("\nTotal employee count & Total Average salary\n------------------------------------");
		DoubleSummaryStatistics dss1 = people.stream().map(obj -> (Employee) obj).collect(Collectors.summarizingDouble(e -> e.getBigDecSalary().doubleValue()));
		System.out.println("Count = "+ dss1.getCount()+"\nAverage = $" + (int)dss1.getAverage());
		
		//Closing message
		System.out.println("\n...Finished processing "+inputFilePath+"\nProgram will now close.");
	}
	
}
