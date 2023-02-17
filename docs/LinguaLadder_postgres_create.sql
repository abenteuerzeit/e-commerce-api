CREATE TABLE "public.Auth" (
	"auth_id" integer NOT NULL,
	"user_id" integer NOT NULL,
	"auth_level" TEXT NOT NULL,
	CONSTRAINT "Auth_pk" PRIMARY KEY ("auth_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Account" (
	"account_id" serial NOT NULL,
	"account_created_at" TIMESTAMP NOT NULL,
	"account_modified_at" TIMESTAMP,
	CONSTRAINT "Account_pk" PRIMARY KEY ("account_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.User" (
	"account_id" integer NOT NULL UNIQUE,
	"user_id" serial NOT NULL,
	"user_email" TEXT NOT NULL UNIQUE,
	CONSTRAINT "User_pk" PRIMARY KEY ("user_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Private" (
	"private_id" serial NOT NULL,
	"account_id" integer NOT NULL UNIQUE,
	"private_hash" TEXT NOT NULL,
	"private_birthdate" DATE NOT NULL,
	"private_PESEL" TEXT UNIQUE,
	"private_NIP" TEXT UNIQUE,
	"private_description" TEXT,
	CONSTRAINT "Private_pk" PRIMARY KEY ("private_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Address" (
	"address_id" serial NOT NULL,
	"address_label" TEXT NOT NULL,
	"address_phone" TEXT,
	CONSTRAINT "Address_pk" PRIMARY KEY ("address_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.AddressPrivate" (
	"address_id" integer NOT NULL,
	"private_id" TEXT NOT NULL,
	CONSTRAINT "AddressPrivate_pk" PRIMARY KEY ("address_id","private_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Meeting" (
	"meeting_id" serial NOT NULL,
	"schedule_id" integer NOT NULL,
	"meeting_status" TEXT NOT NULL,
	"meeting_price" DECIMAL NOT NULL,
	"meeting_minutes" integer NOT NULL,
	"meeting_url" TEXT,
	"meeting_start" TIMESTAMP NOT NULL,
	"meeting_end" TIMESTAMP NOT NULL,
	"meeting_notes" TEXT NOT NULL,
	CONSTRAINT "Meeting_pk" PRIMARY KEY ("meeting_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.AccountMeeting" (
	"meeting_id" integer NOT NULL,
	"account_id" integer NOT NULL,
	"teacher_id" integer NOT NULL,
	CONSTRAINT "AccountMeeting_pk" PRIMARY KEY ("meeting_id","account_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Pay" (
	"pay_id" serial NOT NULL,
	"pay_method" TEXT NOT NULL,
	"pay_amount" DECIMAL NOT NULL,
	"pay_time" TIMESTAMP NOT NULL,
	"pay_status" TEXT NOT NULL,
	CONSTRAINT "Pay_pk" PRIMARY KEY ("pay_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Resource" (
	"resource_id" serial NOT NULL,
	"meeting_id" integer NOT NULL,
	"resource_name" TEXT NOT NULL,
	"resource_body" TEXT NOT NULL,
	"resource_url" TEXT,
	CONSTRAINT "Resource_pk" PRIMARY KEY ("resource_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Order" (
	"order_id" serial NOT NULL,
	"user_id" integer NOT NULL,
	"pay_id" integer NOT NULL,
	"order_status" TEXT NOT NULL,
	"order_date" DATETIME NOT NULL,
	"order_price" DECIMAL NOT NULL,
	"order_description" TEXT NOT NULL,
	CONSTRAINT "Order_pk" PRIMARY KEY ("order_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Event" (
	"event_id" serial NOT NULL,
	"user_id" integer NOT NULL UNIQUE,
	"event_name" TEXT NOT NULL,
	"event_datetime" DATETIME NOT NULL,
	"event_status" TEXT NOT NULL,
	CONSTRAINT "Event_pk" PRIMARY KEY ("event_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Feedback" (
	"feedback_id" serial NOT NULL,
	"meeting_id" integer NOT NULL,
	"feedback_text" TEXT NOT NULL,
	"feedback_rating" integer NOT NULL,
	CONSTRAINT "Feedback_pk" PRIMARY KEY ("feedback_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Misc" (
	"misc_id" serial NOT NULL,
	"private_id" integer NOT NULL,
	"misc_key" TEXT NOT NULL UNIQUE,
	"misc_value" TEXT NOT NULL,
	CONSTRAINT "Misc_pk" PRIMARY KEY ("misc_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Message" (
	"message_from" integer NOT NULL,
	"message_to" TEXT NOT NULL,
	"message_id" serial NOT NULL,
	"message_heading" TEXT NOT NULL,
	"message_text" TEXT NOT NULL,
	CONSTRAINT "Message_pk" PRIMARY KEY ("message_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.UserMessage" (
	"message_id" integer NOT NULL,
	"user_id" integer NOT NULL,
	CONSTRAINT "UserMessage_pk" PRIMARY KEY ("message_id","user_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Name" (
	"name_id" serial NOT NULL UNIQUE,
	"user_id" TEXT NOT NULL UNIQUE,
	"name_user" TEXT NOT NULL UNIQUE,
	"name_role" TEXT NOT NULL UNIQUE,
	"name_first" TEXT NOT NULL,
	"name_last" TEXT NOT NULL,
	CONSTRAINT "Name_pk" PRIMARY KEY ("name_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Street" (
	"street_id" serial NOT NULL,
	"address_id" integer NOT NULL UNIQUE,
	"street_name" TEXT NOT NULL,
	"street_building_nr" TEXT NOT NULL,
	"street_door_nr" TEXT,
	CONSTRAINT "Street_pk" PRIMARY KEY ("street_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Region" (
	"region_id" serial NOT NULL,
	"address_id" TEXT NOT NULL UNIQUE,
	"region_city" TEXT NOT NULL,
	"region_postal_code" TEXT NOT NULL,
	"region_country" TEXT NOT NULL,
	CONSTRAINT "Region_pk" PRIMARY KEY ("region_id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "Auth" ADD CONSTRAINT "Auth_fk0" FOREIGN KEY ("user_id") REFERENCES "User"("user_id");


ALTER TABLE "User" ADD CONSTRAINT "User_fk0" FOREIGN KEY ("account_id") REFERENCES "Account"("account_id");

ALTER TABLE "Private" ADD CONSTRAINT "Private_fk0" FOREIGN KEY ("account_id") REFERENCES "Account"("account_id");


ALTER TABLE "AddressPrivate" ADD CONSTRAINT "AddressPrivate_fk0" FOREIGN KEY ("address_id") REFERENCES "Address"("address_id");
ALTER TABLE "AddressPrivate" ADD CONSTRAINT "AddressPrivate_fk1" FOREIGN KEY ("private_id") REFERENCES "Private"("account_id");

ALTER TABLE "Meeting" ADD CONSTRAINT "Meeting_fk0" FOREIGN KEY ("schedule_id") REFERENCES "Event"("event_id");

ALTER TABLE "AccountMeeting" ADD CONSTRAINT "AccountMeeting_fk0" FOREIGN KEY ("meeting_id") REFERENCES "Meeting"("meeting_id");
ALTER TABLE "AccountMeeting" ADD CONSTRAINT "AccountMeeting_fk1" FOREIGN KEY ("account_id") REFERENCES "Account"("account_id");
ALTER TABLE "AccountMeeting" ADD CONSTRAINT "AccountMeeting_fk2" FOREIGN KEY ("teacher_id") REFERENCES "User"("user_id");


ALTER TABLE "Resource" ADD CONSTRAINT "Resource_fk0" FOREIGN KEY ("meeting_id") REFERENCES "Meeting"("meeting_id");

ALTER TABLE "Order" ADD CONSTRAINT "Order_fk0" FOREIGN KEY ("user_id") REFERENCES "User"("user_id");
ALTER TABLE "Order" ADD CONSTRAINT "Order_fk1" FOREIGN KEY ("pay_id") REFERENCES "Pay"("pay_id");

ALTER TABLE "Event" ADD CONSTRAINT "Event_fk0" FOREIGN KEY ("user_id") REFERENCES "User"("user_id");

ALTER TABLE "Feedback" ADD CONSTRAINT "Feedback_fk0" FOREIGN KEY ("meeting_id") REFERENCES "Meeting"("meeting_id");

ALTER TABLE "Misc" ADD CONSTRAINT "Misc_fk0" FOREIGN KEY ("private_id") REFERENCES "Private"("private_id");

ALTER TABLE "Message" ADD CONSTRAINT "Message_fk0" FOREIGN KEY ("message_from") REFERENCES "User"("user_id");
ALTER TABLE "Message" ADD CONSTRAINT "Message_fk1" FOREIGN KEY ("message_to") REFERENCES "User"("user_id");

ALTER TABLE "UserMessage" ADD CONSTRAINT "UserMessage_fk0" FOREIGN KEY ("message_id") REFERENCES "Message"("message_id");
ALTER TABLE "UserMessage" ADD CONSTRAINT "UserMessage_fk1" FOREIGN KEY ("user_id") REFERENCES "User"("user_id");

ALTER TABLE "Name" ADD CONSTRAINT "Name_fk0" FOREIGN KEY ("user_id") REFERENCES "User"("user_id");

ALTER TABLE "Street" ADD CONSTRAINT "Street_fk0" FOREIGN KEY ("address_id") REFERENCES "Address"("address_id");

ALTER TABLE "Region" ADD CONSTRAINT "Region_fk0" FOREIGN KEY ("address_id") REFERENCES "Address"("address_id");




















