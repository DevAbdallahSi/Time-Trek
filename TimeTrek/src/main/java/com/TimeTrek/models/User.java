package com.TimeTrek.models;


import java.util.Date;




import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
    
@Entity
@Table(name="users")
public class User {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotNull()
//    @NotEmpty(message="firstName is required!")
    @Size(min=3, max=30, message="must be atleast 3 characters")
    private String firstName;
    
    @NotNull()
//    @NotEmpty(message="lastName is required!")
    @Size(min=3, max=30, message="must be atleast 3 characters")
    private String lastName;   
    

//    @NotEmpty(message="Email is required!")
    @NotNull
    @Email(message="Please enter a valid email!")
    @Column(unique = true)
    private String email;
    
//    @NotEmpty(message="Password is required!")
    @NotNull
    @Size(min=8, max=128, message="must be between 8 and 128 characters")
    private String password;
    
    @Transient
//    @NotEmpty(message="Confirm Password is required!")
//    @Size(min=8, max=128, message="this filled match") 
    private String confirm;
    
//    
//    
    @OneToMany(mappedBy = "owner" ,fetch = FetchType.EAGER )
    private List<Goal> ownedGoals;
    
    
    @Transient
    private Integer activeGoals;
    @Transient
	private Integer completedToday;
    @Transient
	private Integer minutesTracked;
    @Transient
	private Integer dayStreak;

    

    
	public Integer getActiveGoals() {
		return activeGoals;
	}
	public void setActiveGoals(Integer activeGoals) {
		this.activeGoals = activeGoals;
	}
	public Integer getCompletedToday() {
		return completedToday;
	}
	public void setCompletedToday(Integer completedToday) {
		this.completedToday = completedToday;
	}
	public Integer getMinutesTracked() {
		return minutesTracked;
	}
	public void setMinutesTracked(Integer minutesTracked) {
		this.minutesTracked = minutesTracked;
	}
	public Integer getDayStreak() {
		return dayStreak;
	}
	public void setDayStreak(Integer dayStreak) {
		this.dayStreak = dayStreak;
	}
	@Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
	
    public List<Goal> getOwnedGoals() {
		return ownedGoals;
	}
	public void setOwnedGoals(List<Goal> ownedGoals) {
		this.ownedGoals = ownedGoals;
	}
	@DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
  
    public User() {}
    public User(String firstName,String email,String lastName,String password,String confirm) {
    	this.firstName=firstName;
    	this.lastName=lastName;
    	this.email=email;
    	this.password=password;
    	this.confirm=confirm;
    }


	
	
	public Long getId() {
  		return id;
  	}

  	public void setId(Long id) {
  		this.id = id;
  	}
  	public String getLastName() {
  		return lastName;
  	}
  	public void setLastName(String lastName) {
  		this.lastName = lastName;
  	}
  

  	

  	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getEmail() {
  		return email;
  	}

  	public void setEmail(String email) {
  		this.email = email;
  	}

  	public String getPassword() {
  		return password;
  	}

  	public void setPassword(String password) {
  		this.password = password;
  	}

  	public String getConfirm() {
  		return confirm;
  	}

  	public void setConfirm(String confirm) {
  		this.confirm = confirm;
  	}
  	 @PrePersist
	    protected void onCreate(){
	        this.createdAt = new Date();
	    }
	    @PreUpdate
	    protected void onUpdate(){
	    	this.updatedAt = new Date();
	    }
    
  
}