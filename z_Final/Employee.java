import java.math.BigDecimal;


public class Employee implements Person {
	//instance variables
	private String id = "", firstname = "", lastname = "", salary ="";
	//public enum salaryRanges {
	//	LESS25000,
	//	BETWEEN25000_40000,
	//	BETWEEN40000_70000,
	//	OVER70000
	//}
	
	//parameterized constructor
	Employee(String id, String fn, String ln, String salary){
		this.id = id; this.firstname = fn; this.lastname = ln; this.salary = salary;
	}
	public String getFirstname() {
		return firstname;
	}
	public String getLastname() {
		return lastname;
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
			System.out.println("The salary data for employee with id: \""+this.id+"\" does not contain a number.\nPlease fix input file!\nProgram will close.");
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
		return (this.firstname +" "+this.lastname);
	}
	//splits up csv strings and checks for unwanted characters - return employee object created for string splits
	public static Person parse(String str) {
		String[] splits = str.split(",");
		if(splits.length<4) {
			System.out.println("Error found when parsing file - missing field.\nSystem will now close");
			System.exit(0);
		}
		for(int a=0; a<splits.length; a++) {
			if(splits[a].isEmpty()||splits[a]==null) {
				System.out.println("Error found when parsing file - missing field.\nSystem will now close");
				System.exit(0);
			}
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
		BigDecimal bdSalary = new BigDecimal(e.salary);
		if (bdSalary.compareTo(BigDecimal.valueOf(25000))<0) return SalaryRange.less25;
		else if (bdSalary.compareTo(BigDecimal.valueOf(25000))>=0 && bdSalary.compareTo(BigDecimal.valueOf(40000))<0) return SalaryRange.from25to40;
		else if (bdSalary.compareTo(BigDecimal.valueOf(40000))>=0 && bdSalary.compareTo(BigDecimal.valueOf(70000))<0) return SalaryRange.from40to70;
		else return SalaryRange.more70;
	}
	
	// public salaryRanges getSalaryRange() {
        //	BigDecimal salary = getSalary();
        //	if (salary.compareTo(BigDecimal.valueOf(25_000)) < 0)
        //    		return salaryRanges.LESS25000;
        //	else if (salary.compareTo(BigDecimal.valueOf(40_000)) < 0)
        //    		return salaryRanges.BETWEEN25000_40000;
        //	else if (salary.compareTo(BigDecimal.valueOf(70_000)) < 0)
        //    		return salaryRanges.BETWEEN40000_70000;
        //	else
        //    		return salaryRanges.OVER70000;
    }
		
}
