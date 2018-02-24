package services;

public enum StatusResponse {

	SUCCESS("Sucess"),
	ERROR("Error");
	
	private String status;
	
	StatusResponse(final String value) {
		this.status = value;
	}

	public String getStatusResponse() {
		return status;
	}

	@Override
	public String toString() {
		return status;
	}

}
