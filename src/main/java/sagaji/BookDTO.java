package sagaji;

public class BookDTO {
	private String bookid;
	private String bookname;
	private String author;
	private String company;
	private String story;
	
	public BookDTO() {
	}
	
	public BookDTO(String bookname, String story, String bookid) {
		this.bookname = bookname;
		this.story = story;
		this.bookid = bookid;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getBookname() {
		return bookname;
	}

	public void setBookname(String bookname) {
		this.bookname = bookname;
	}

	public String getStory() {
		return story;
	}

	public void setStory(String story) {
		this.story = story;
	}

	public String getBookid() {
		return bookid;
	}

	public void setBookid(String bookid) {
		this.bookid = bookid;
	}
}
