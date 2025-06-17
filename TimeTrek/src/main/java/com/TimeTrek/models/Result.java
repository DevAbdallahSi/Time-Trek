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
@Table(name = "results")
public class Result {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

//    @NotBlank(message = "status is required")

	private boolean status;

	@NotBlank(message = "content: is required")
	@Column(columnDefinition = "TEXT")
	private String content;

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
	public Result() {
	}

	public Result(boolean status, String content) {
		this.status = status;
		this.content = content;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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