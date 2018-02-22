package commons;

public enum EnumDataBases {

	TEST("tests"), PRODUCTION("syscar");

	private final String value;

	EnumDataBases(final String value) {
		this.value = value;
	}

	public String getEnumDataBases() {
		return value;
	}

	@Override
	public String toString() {
		return value;
	}
}
