package com.it2299.ffth.reincoast.util;

import javax.ws.rs.core.MediaType;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;
import com.sun.jersey.core.util.MultivaluedMapImpl;

public class Email {
	private final String api = "key-68x0vxl3sd7k-aids5--kasgq7u7-yw0";
	private final String domain = "sandbox77521.mailgun.org";
	private WebResource webResource;
	private String from;
	private String to;
	private String subject;
	private String message;

	public Email() {
		Client client = Client.create();
		client.addFilter(new HTTPBasicAuthFilter("api", api));

		webResource = client.resource("https://api.mailgun.net/v2/" + domain + "/messages");

	}

	public ClientResponse send() {
		MultivaluedMapImpl formData = new MultivaluedMapImpl();
		formData.add("from", from);
		formData.add("to", to);
		formData.add("subject", subject);
		formData.add("text", message);

		return webResource.type(MediaType.APPLICATION_FORM_URLENCODED).post(ClientResponse.class, formData);
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
