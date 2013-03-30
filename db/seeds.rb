# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

json_payload = {
    :ANDROID_VERSION => "4.1.2",
    :PHONE_MODEL => "MyModel 2.0",
    :APP_VERSION_NAME => "0.0.1",
    :APP_VERSION_CODE => "app_version_code",
    :USER_APP_START_DATE => 1.hour.ago,
    :BRAND => "brand_name",
    :IS_SILENT => "true",
    :CUSTOM_DATA => "USER = app_user\n",
    :STACK_TRACE => "com.company.android.utils.BadAuthenticationCredentialsException: Authentication request failed. HTTP response should be 200 but was 401\n" \
	                  "at com.company.android.http.HttpClient.getJsonAnswerFromConnection(HttpClient.java:64)\n" \
                    "and so on..."
  }.to_json

Error.transaction do
  1000.times do |i|
    Error.create!(:payload => json_payload)
  end
end
