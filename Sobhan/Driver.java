package question1;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Scanner;

public class Driver {
	
	public static void main(String[] args)
	{
		Employee[] employeeList;
		Scanner keyboard = new Scanner(System.in);
		String fileName;
		
		System.out.println("-------- Employee Sorter --------");
		System.out.println();
		
		// Prompting user
		System.out.print("Please enter the employee file: ");
		fileName = keyboard.next();
		
		try(BufferedReader input = new BufferedReader(new FileReader(fileName));
			BufferedReader counter = new BufferedReader(new FileReader(fileName)))
		{
			// counting number of employees
			int employeeCount = 0;
			while (counter.readLine() != null)
			{
				employeeCount++;
			}
			
			// creating list of employees
			employeeList = new Employee[employeeCount];
			for(int i = 0 ; i < employeeCount ; i++)
			{
				employeeList[i] = Employee.parse(input.readLine());
			}
			
			// sort and print by ID
			System.out.println("\n======== Sorted By ID ========\n");
			Arrays.sort(employeeList, (Comparator<Employee>) (Employee a, Employee b)->{ return a.getID().compareTo(b.getID());});
			for(Employee e : employeeList)
				System.out.println(e);
			
			//sort and print by name
			System.out.println("\n======== Sorted By Name ========\n");
			Arrays.sort(employeeList, (Comparator<Employee>) (Employee a, Employee b)->
				{if (a.getFirstName().equals(b.getFirstName()))
					return a.getLastName().compareTo(b.getLastName());
				else
					return a.getFirstName().compareTo(b.getFirstName());});
			for(Employee e : employeeList)
				System.out.println(e);
			
			
			// finding and printing all the stats
			long less25k = Arrays.stream(employeeList).mapToDouble(e -> e.getSalaray().doubleValue()).filter(e -> e < 25000).count();
			double less25kAvg = Arrays.stream(employeeList).mapToDouble(e -> e.getSalaray().doubleValue()).filter(e -> e < 25000).sum() / less25k;
			long num25kto50k = Arrays.stream(employeeList).mapToDouble(e -> e.getSalaray().doubleValue()).filter(e -> e >= 25000 && e < 40000).count();
			double num25kto50kAvg = Arrays.stream(employeeList).mapToDouble(e -> e.getSalaray().doubleValue()).filter(e -> e >= 25000 && e < 40000).sum() / num25kto50k ;
			long num50kto70k = Arrays.stream(employeeList).mapToDouble(e -> e.getSalaray().doubleValue()).filter(e -> e >= 40000 && e < 70000).count();
			double num50kto70kAvg = Arrays.stream(employeeList).mapToDouble(e -> e.getSalaray().doubleValue()).filter(e -> e >= 40000 && e <= 70000).sum() / num50kto70k;
			long more70k = Arrays.stream(employeeList).mapToDouble(e -> e.getSalaray().doubleValue()).filter(e -> e > 70000).count();
			double more70kAvg = Arrays.stream(employeeList).mapToDouble(e -> e.getSalaray().doubleValue()).filter(e -> e > 70000).sum() / more70k;
			double totalAvg = Arrays.stream(employeeList).mapToDouble(e -> e.getSalaray().doubleValue()).sum() / employeeCount;
			
			System.out.println("\n======== Statistics ========\n");
			System.out.println(less25k + " employees make under $25,000. Their average salary is $" + less25kAvg);
			System.out.println(num25kto50k + " employees make between $25,000 and $50,000. Their average salary is $" + num25kto50kAvg);
			System.out.println(num50kto70k + " employees make between $50,000 and $70,000. Their average salary is $" + num50kto70kAvg);
			System.out.println(more70k + " employees make above $70,000. Their average salary is $" + more70kAvg);
			System.out.println("There are a total of " + employeeCount + " employees. Their average salary is $" + totalAvg);
		} 
		catch (FileNotFoundException e) {
			System.out.println("FILE DOES NOT EXIST! GOODBYE!");
			System.exit(0);
		}
		catch (IOException e) {
			System.out.println("ERROR! GOODBYE!");
			System.exit(0);
		}
		
		keyboard.close();
		System.out.println("\nGoodbye.");
		
	}

}
