package com.TimeTrek.models;





import java.time.LocalDate;

import java.util.ArrayList;
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
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.validation.constraints.FutureOrPresent;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "goals")
public class Goal {



    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Title is required")
    @Size(min = 4, max = 100, message = "Title must be between 4 and 100 characters")
    private String title;

    @NotBlank(message = "Description: is required")
    @Size(min = 21, max = 500, message = "Description: must be between 20 and 500 characters")
    private String details;


//    @DateTimeFormat(pattern = "yyyy-MM-dd")
//    @NotNull(message = "Due date must be provided.")
//    @FutureOrPresent(message = "Due date must not be in the past.")
//    private LocalDate date;
    
    @ManyToOne
    @JoinColumn(name = "owner_id")
    private User owner;
    
    
//    @ManyToMany
//    @JoinTable(
//        name = "users_projects", // custom name of the join table
//        joinColumns = @JoinColumn(name = "talk_id"), // FK to this entity
//        inverseJoinColumns = @JoinColumn(name = "user_id") // FK to the other entity
//    )
//    private List<User> members= new ArrayList<>();

    
	public User getOwner() {
		return owner;
	}

	public void setOwner(User owner) {
		this.owner = owner;
	}

	

	@Column(updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;

    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedAt;

    // Constructors
    public Goal() {}

    public Goal(String title, String details) {
        this.title = title;
        this.details = details;
    }

    
    

	

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}



	public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

   

    public Date getCreatedAt() {
        return createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    @PrePersist
    protected void onCreate() {
        this.createdAt = new Date();
    }

    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = new Date();
    }
}