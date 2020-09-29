import java.math.BigDecimal;


public class Employee implements Person {
	//instance variables
	private String id = "", firstname = "", lastname = "", salary ="";
	//parameterized constructor
	Employee(String id, String fn, String ln, String salary){
		this.id = id; this.firstname = fn; this.lastname = ln; this.salary = salary;
	}
	//getters and setters	
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public void setId(String id) {
		this.id = id;
	}
	//returns employee info in format id, full name, salary
	public String toString() {
		return String.format("%s, %25s %s", id, this.getName()+",", salary);
		//return (id +", "+this.getName()+", "+salary);
	}
	//converts salary string to BigDecimal - try catch ensure the string to be converted is a number
	public BigDecimal getBigDecSalary() {
		BigDecimal bd=null;
		try {
			bd = new BigDecimal(salary);
		}
		catch(NumberFormatException e) {
			System.out.println("The salary data for employee with id: \""+this.getId()+"\" does not contain a number.\nPlease fix input file!\nProgram will close.");
			System.exit(0);
		}
		return bd;
	}
	
	@Override
	public String getId() {
		return id;
	}
	@Override
	public String getName() {
		return (this.getFirstname() +" "+this.getLastname());
	}
	//splits up csv strings and checks for unwanted characters - return employee object created for string splits
	public static Person parse(String str) {
		String[] splits = str.split(",");
		for(int a=0; a<splits.length; a++) {
			if(splits[a].charAt(0)=='"' || splits[a].charAt(0)=='.') {
				splits[a] = splits[a].substring(1);
			}
			if(splits[a].charAt((splits[a].length()-1))=='"'||splits[a].charAt((splits[a].length()-1))=='.') {
				splits[a] = splits[a].substring(0,(splits[a].length()-1));
			}
		}
		return new Employee(splits[0],splits[1],splits[2],splits[3]);
	}
	//assigns enum values to employee objects - used in stream grouping	
	public static SalaryRange sortRange(Employee e) {
		BigDecimal bdSalary = new BigDecimal(e.getSalary());
		if (bdSalary.compareTo(BigDecimal.valueOf(25000))<0) return SalaryRange.less25;
		else if (bdSalary.compareTo(BigDecimal.valueOf(25000))>=0 && bdSalary.compareTo(BigDecimal.valueOf(40000))<0) return SalaryRange.from25to40;
		else if (bdSalary.compareTo(BigDecimal.valueOf(40000))>=0 && bdSalary.compareTo(BigDecimal.valueOf(70000))<0) return SalaryRange.from40to70;
		else return SalaryRange.more70;
	}
		
}
