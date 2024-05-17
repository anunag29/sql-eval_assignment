CREATE TABLE accounts (
id bigint,
logo character varying,
ceo_id bigint,
timezone character varying,
created_at timestamp without time zone,
enable_kpi boolean,
updated_at timestamp without time zone,
domain_name character varying,
account_type character varying,
company_name character varying,
country_code character varying,
email_client character varying,
metabase_type bigint,
planning_year bigint,
remote_policy character varying,
setting_tokens character varying,
record_sessions boolean,
trial_objective character varying,
messaging_client bigint,
survey_frequency character varying,
enable_okr_update boolean,
preferred_product character varying,
company_size_range character varying,
run_coffee_connect boolean,
department_hierachy character varying,
company_phone_number character varying,
enable_goal_metadata boolean,
glassdoor_review_link character varying,
create_private_reviews boolean,
signupform_communication_tool character varying
);

CREATE TABLE acl_role_members (
id bigint,
member_id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
acl_role_id bigint,
member_type character varying,
discarded_at timestamp without time zone,
discarded_by_id bigint
);

CREATE TABLE acl_roles (
id bigint,
name character varying,
account_id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
description character varying,
discarded_at timestamp without time zone,
discarded_by_id bigint
);

CREATE TABLE acls (
id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
resource_id bigint,
actorable_id bigint,
discarded_at timestamp without time zone,
created_by_id bigint,
resource_type character varying,
actorable_type character varying,
discarded_by_id bigint,
permission_type bigint
);

CREATE TABLE biz_review_action_items (
id bigint,
title character varying,
item_id bigint,
completed boolean,
item_type character varying,
created_at timestamp without time zone,
updated_at timestamp without time zone,
discarded_at timestamp without time zone,
biz_review_card_id bigint,
super_list_item_id bigint,
biz_review_schedule_id bigint,
completed_biz_review_schedule_id bigint
);

CREATE TABLE biz_review_cards (
id bigint,
title character varying,
width bigint,
height bigint,
x_axis bigint,
y_axis bigint,
created_at timestamp without time zone,
properties character varying,
section_id bigint,
updated_at timestamp without time zone,
added_by_id bigint,
card_control character varying,
discarded_at timestamp without time zone,
saved_response character varying,
discarded_by_id bigint,
user_provided_title character varying,
biz_review_widget_id bigint,
biz_review_schedule_id bigint
);

CREATE TABLE biz_review_comments (
id bigint,
body character varying,
parent_id bigint,
created_at timestamp without time zone,
identifier character varying,
updated_at timestamp without time zone,
comment_html character varying,
comment_json character varying,
discarded_at timestamp without time zone,
selected_text character varying,
commented_by_id bigint,
biz_review_card_id bigint,
biz_review_schedule_id bigint
);

CREATE TABLE biz_review_notes (
id bigint,
note_html character varying,
note_text character varying,
note_ydoc character varying,
scheduled boolean,
created_at timestamp without time zone,
updated_at timestamp without time zone,
discarded_at timestamp without time zone,
last_edited_by_id bigint,
biz_review_card_id bigint
);

CREATE TABLE biz_review_schedule_goal_activity_mappings (
id bigint,
goal_id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
goal_activity_id bigint,
biz_review_schedule_id bigint
);

CREATE TABLE biz_review_schedules (
id bigint,
title character varying,
status bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
discarded_at timestamp without time zone,
scheduled_at timestamp without time zone,
biz_review_id bigint,
cycle_end_date timestamp without time zone,
layout_editable boolean,
cycle_start_date timestamp without time zone
);

CREATE TABLE biz_review_widgets (
id bigint,
name character varying,
created_at timestamp without time zone,
properties character varying,
updated_at timestamp without time zone,
widget_type bigint
);

CREATE TABLE biz_reviews (
id bigint,
title character varying,
shared boolean,
end_date timestamp without time zone,
owner_id bigint,
frequency bigint,
account_id bigint,
created_at timestamp without time zone,
owner_type character varying,
start_date timestamp without time zone,
updated_at timestamp without time zone,
discarded_at timestamp without time zone,
created_by_id bigint,
biz_review_type character varying,
auto_create_next_review timestamp without time zone
);

CREATE TABLE departments (
id bigint,
name character varying,
active boolean,
ancestry character varying,
account_id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
discarded_at timestamp without time zone,
ancestry_depth bigint,
department_type bigint,
department_type_name character varying
);

CREATE TABLE drivers (
id BIGSERIAL PRIMARY KEY,
name character varying(255),
key character varying(255),
explanation text,
parent_driver_id bigint,
icon text,
driver_type character varying(255),
driver_text text,
priority integer DEFAULT 1,
root_driver_id integer,
driver_level integer,
account_id bigint
);

CREATE TABLE employee_biz_review_action_items (
id bigint,
employee_id bigint,
biz_review_action_item_id bigint
);

CREATE TABLE employee_chat_questions (
id bigint,
position bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
question_id bigint,
employee_chat_id bigint
);

CREATE TABLE employee_chats (
id bigint,
run_at timestamp without time zone,
account_id bigint,
created_at timestamp without time zone,
expires_at timestamp without time zone,
manager_id bigint,
updated_at timestamp without time zone,
employee_id bigint,
schedule_id bigint
);

CREATE TABLE employee_checkin_comments (
id bigint,
comment character varying,
created_at timestamp without time zone,
updated_at timestamp without time zone,
reportee_id bigint,
employee_checkin_logger_id bigint
);

CREATE TABLE employee_goals (
id bigint,
goal_id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
employee_id bigint,
discarded_at timestamp without time zone
);

CREATE TABLE employee_satisfactions (
id bigint,
comments character varying,
nps_score bigint,
account_id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
employee_id bigint,
feedback_id bigint,
question_id bigint,
schedule_id bigint,
feedback_type character varying,
employee_chat_id bigint,
satisfaction_type character varying
);

CREATE TABLE employees (
id bigint,
age bigint,
level character varying,
title character varying,
gender character varying,
invited boolean,
user_id bigint,
division character varying,
location character varying,
org_role character varying,
timezone character varying,
full_name character varying,
account_id bigint,
created_at timestamp without time zone,
first_name character varying,
goal_admin boolean,
manager_id bigint,
updated_at timestamp without time zone,
nps_enabled boolean,
activated_at timestamp without time zone,
date_of_exit timestamp without time zone,
phone_number character varying,
account_admin boolean,
business_unit character varying,
department_id bigint,
anonymous_name character varying,
billing_status character varying,
deactivated_at timestamp without time zone,
cc_meeting_pref bigint,
date_of_joining timestamp without time zone,
department_name character varying,
employee_source character varying,
employment_type character varying,
profile_picture character varying,
pulse_frequency character varying,
reportees_count bigint,
run_coffee_connect boolean,
company_employee_id character varying,
primary_phone_number character varying,
relationship_updated boolean,
send_manager_checkin boolean,
one_on_ones_updated_at timestamp without time zone,
personal_email_address character varying,
secondary_phone_number character varying,
calendar_event_organizer_id bigint,
calendar_data_last_updated_at timestamp without time zone
);

CREATE TABLE feature_metadata_values (
id bigint,
created_at timestamp without time zone,
feature_id bigint,
updated_at timestamp without time zone,
feature_type character varying,
metadata_value_id bigint
);

CREATE TABLE follow_up_questions (
id bigint,
option_id bigint,
sentiment character varying,
created_at timestamp without time zone,
updated_at timestamp without time zone,
follow_up_question_id bigint
);

CREATE TABLE global_averages (
id bigint,
benchmark bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
items_count bigint,
benchmarkable_id bigint,
benchmarkable_type character varying
);

CREATE TABLE goal_activities (
id bigint,
source bigint,
status bigint,
goal_id bigint,
edited_at timestamp without time zone,
created_at timestamp without time zone,
updated_at timestamp without time zone,
description character varying,
employee_id bigint,
checkin_time timestamp without time zone,
checkin_type bigint,
discarded_at timestamp without time zone,
edited_by_id bigint,
activity_type bigint,
progress_type bigint,
system_comment boolean,
activity_log_id bigint,
completed_value numeric(38,9),
old_description character varying,
description_json character varying,
source_key_result_id bigint,
previous_progress_type bigint,
previous_progress_value numeric(38,9),
previous_progress_status bigint
);

CREATE TABLE goal_cycles (
id bigint,
name character varying,
year character varying,
cycle character varying,
end_date timestamp without time zone,
account_id bigint,
cycle_type character varying,
start_date timestamp without time zone
);

CREATE TABLE goal_filters (
id bigint,
priority bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
employee_id bigint,
discarded_at timestamp without time zone,
filterable_id bigint,
filterable_type character varying
);

CREATE TABLE goal_hierarchies (
id bigint,
depth bigint,
child_id bigint,
parent_id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
objective_type bigint
);

CREATE TABLE goal_mentions (
id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
employee_id bigint,
goal_activity_id bigint
);

CREATE TABLE goal_milestones (
id bigint,
goal_id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
goal_cycle_id bigint,
milestone_type bigint,
progress_start numeric(38,9),
progress_target numeric(38,9),
milestone_goal_id bigint
);

CREATE TABLE goal_progress_types (
id bigint,
title character varying,
max_val numeric(38,9),
min_val numeric(38,9),
position bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
discarded_at timestamp without time zone,
connected_to_children boolean
);

CREATE TABLE goal_progresses (
id bigint,
goal_id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
discarded_at timestamp without time zone,
progress_start numeric(38,9),
progress_status bigint,
progress_target numeric(38,9),
progress_weight bigint,
current_progress numeric(38,9),
progress_percent numeric(38,9),
goal_progress_type_id bigint
);

CREATE TABLE goals (
id bigint,
title character varying,
native boolean,
public boolean,
ancestry character varying,
due_date timestamp without time zone,
goal_type bigint,
account_id bigint,
created_at timestamp without time zone,
start_date timestamp without time zone,
updated_at timestamp without time zone,
added_by_id bigint,
description character varying,
discarded_at timestamp without time zone,
is_milestone boolean,
department_id bigint,
goal_cycle_id bigint,
is_key_result boolean,
weighted_goal boolean,
ancestry_depth bigint,
has_milestones boolean,
objective_type bigint,
department_name character varying,
duplicated_from_id bigint,
has_milestone_goals boolean,
milestone_split_type bigint
);

CREATE TABLE goals_departments (
id bigint,
goal_id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
department_id bigint
);

CREATE TABLE goals_onboarding_checklists (
id bigint,
created_at timestamp without time zone,
goal_added boolean,
updated_at timestamp without time zone,
employee_id bigint,
team_invited boolean,
explored_demo boolean,
progress_checkin_done boolean
);

CREATE TABLE goals_settings (
id bigint,
time character varying,
active boolean,
account_id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
employee_id bigint,
day_of_month character varying,
reminder_day bigint,
department_id bigint,
reminder_time timestamp without time zone,
next_reminder_at timestamp without time zone,
reminder_frequency character varying,
reminder_last_sent_on timestamp without time zone
);

CREATE TABLE mentions (
id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
employee_id bigint,
resource_id bigint,
resource_type character varying
);

CREATE TABLE metadata_fields (
id bigint,
hidable boolean,
sortable boolean,
account_id bigint,
created_at timestamp without time zone,
field_name character varying,
field_type bigint,
updated_at timestamp without time zone,
discarded_at timestamp without time zone,
field_source bigint,
created_by_id bigint,
metadata_type bigint
);

CREATE TABLE metadata_options (
id bigint,
value character varying,
created_at timestamp without time zone,
link_value character varying,
text_value character varying,
updated_at timestamp without time zone,
external_id character varying,
date_field_value timestamp without time zone,
employee_id_value bigint,
metadata_field_id bigint,
number_field_value numeric(38,9)
);

CREATE TABLE metadata_value_metadata_options (
id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
metadata_value_id bigint,
metadata_option_id bigint
);

CREATE TABLE metadata_values (
id bigint,
value character varying,
owner_id bigint,
created_at timestamp without time zone,
link_value character varying,
owner_type character varying,
text_value character varying,
updated_at timestamp without time zone,
discarded_at timestamp without time zone,
created_by_id bigint,
date_field_value timestamp without time zone,
goal_activity_id bigint,
employee_id_value bigint,
metadata_field_id bigint,
number_field_value numeric(38,9)
);

CREATE TABLE okr_update_goal_activity_mappings (
id bigint,
goal_id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
okr_update_id bigint,
goal_activity_id bigint
);

CREATE TABLE okr_update_recipients (
id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
recipient_id bigint,
okr_update_id bigint,
recipient_type character varying
);

CREATE TABLE okr_updates (
id bigint,
status bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
resource_id bigint,
current_step bigint,
posted_by_id bigint,
summary_html character varying,
summary_json character varying,
created_by_id bigint,
resource_type character varying,
goals_setting_id bigint
);

CREATE TABLE okr_updates_goal_cycles (
id bigint,
status bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
goal_cycle_id bigint,
okr_update_id bigint
);

CREATE TABLE okr_updates_goals (
id bigint,
status bigint,
goal_id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
okr_update_id bigint
);

CREATE TABLE one_on_one_action_items (
id bigint,
private boolean,
complete boolean,
owner_id bigint,
item_text character varying,
created_at timestamp without time zone,
updated_at timestamp without time zone,
one_on_one_id bigint,
other_party_id bigint,
super_list_item_id bigint
);

CREATE TABLE one_on_one_agenda_templates (
id bigint,
category character varying,
created_at timestamp without time zone,
updated_at timestamp without time zone,
talking_point character varying,
bookmark_count bigint,
parent_agenda_id bigint,
talking_point_type bigint,
manually_recommended_at timestamp without time zone
);

CREATE TABLE one_on_one_agendas (
id bigint,
title character varying,
private boolean,
complete boolean,
owner_id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
one_on_one_id bigint,
other_party_id bigint,
one_on_one_note_id bigint,
super_list_item_id bigint,
talking_point_item_id character varying,
one_on_one_agenda_template_id bigint
);

CREATE TABLE one_on_one_notes (
id bigint,
edited boolean,
private boolean,
owner_id bigint,
note_text character varying,
created_at timestamp without time zone,
updated_at timestamp without time zone,
one_on_one_id bigint,
notes_json_text character varying,
last_modified_by bigint
);

CREATE TABLE one_on_one_settings (
id bigint,
account_id bigint,
completion_tracking boolean,
productivity_tracking boolean,
manager_completion_only boolean,
shared_notes_visibility boolean,
notes_visibility_changed_at timestamp without time zone
);

CREATE TABLE one_on_ones (
id bigint,
title character varying,
cal_id character varying,
status bigint,
end_time timestamp without time zone,
ical_uid character varying,
created_at timestamp without time zone,
creator_id bigint,
manager_id bigint,
start_time timestamp without time zone,
updated_at timestamp without time zone,
reportee_id bigint,
completed_at timestamp without time zone,
scheduled_time timestamp without time zone,
completed_by_id bigint,
manager_reminder boolean,
employee_reminder boolean,
recurring_event_id character varying
);

CREATE TABLE options (
id bigint,
value character varying,
legend character varying,
driver_id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
question_id bigint,
score_visible boolean,
is_others_option boolean
);

CREATE TABLE pulse_questions (
id bigint,
position bigint,
pulse_id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
question_id bigint
);

CREATE TABLE pulse_reasons (
id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
driver_name character varying,
question_id bigint,
reason_text character varying,
reason_type character varying,
linked_rating bigint,
question_text character varying,
super_list_text character varying
);

CREATE TABLE pulse_response_meta_infos (
id bigint,
pulse_id bigint,
need_help boolean,
created_at timestamp without time zone,
updated_at timestamp without time zone,
pulse_reason_id bigint,
reason_adjective bigint,
meta_info_content character varying,
pulse_response_id bigint
);

CREATE TABLE pulse_responses (
id bigint,
score bigint,
pulse_id bigint,
option_id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
employee_id bigint,
question_id bigint,
schedule_id bigint,
response_text character varying,
priority_position bigint,
pulse_question_id bigint
);

CREATE TABLE pulse_template_questions (
id bigint,
position bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
question_id bigint,
pulse_template_id bigint
);

CREATE TABLE pulse_templates (
id bigint,
owner_id bigint,
created_at timestamp without time zone,
owner_role bigint,
owner_type character varying,
updated_at timestamp without time zone,
template_type bigint
);

CREATE TABLE pulses (
id bigint,
status bigint,
end_date timestamp without time zone,
account_id bigint,
created_at timestamp without time zone,
manager_id bigint,
pulse_type bigint,
start_date timestamp without time zone,
updated_at timestamp without time zone,
employee_id bigint,
reportee_id bigint,
reviewed_on timestamp without time zone,
schedule_id bigint,
pulseable_id bigint,
submitted_on timestamp without time zone,
one_on_one_id bigint,
pulseable_type character varying
);

CREATE TABLE questions (
id bigint,
key character varying,
hints character varying,
status character varying,
nps_low character varying,
category character varying,
nps_high character varying,
tab_name character varying,
driver_id bigint,
need_help boolean,
account_id bigint,
alias_text character varying,
created_at timestamp without time zone,
updated_at timestamp without time zone,
discarded_at timestamp without time zone,
followup_type character varying,
question_text character varying,
question_type character varying,
root_question boolean,
can_be_skipped boolean,
negative_quest character varying,
positive_quest character varying,
serviceable_id bigint,
serviceable_type character varying,
question_sentiment character varying,
perspective_question_text character varying
);

CREATE TABLE responses (
id bigint,
closed_at timestamp without time zone,
is_closed boolean,
nps_score bigint,
option_id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
employee_id bigint,
question_id bigint,
schedule_id bigint,
discarded_at timestamp without time zone,
is_responded boolean,
response_text character varying,
employee_chat_id bigint,
responded_by_whom_id bigint,
reminder_mail_sent_at timestamp without time zone,
response_text_sentiment numeric(38,9),
reminder_mail_sent_count bigint,
response_text_word_count bigint
);

CREATE TABLE review_copy_messages (
id bigint,
content character varying,
section character varying,
subject character varying,
account_id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
discarded_at timestamp without time zone,
email_content character varying,
review_cycle_id bigint,
notification_type bigint,
notification_channel bigint,
review_cycle_phase_id bigint
);

CREATE TABLE review_cycle_calibration_comments (
id bigint,
text character varying,
created_at timestamp without time zone,
reviewee_id bigint,
comment_type character varying,
commenter_id bigint,
discarded_at timestamp without time zone
);

CREATE TABLE review_cycle_calibration_questions (
id bigint,
editable boolean,
position bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
visibility character varying,
column_name character varying,
column_type character varying,
question_id bigint,
discarded_at timestamp without time zone,
question_access character varying,
review_cycle_id bigint,
reviewer_type_id bigint,
past_review_cycle_id bigint
);

CREATE TABLE review_cycle_goal_cycles (
id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
discarded_at timestamp without time zone,
goal_cycle_id bigint,
review_cycle_id bigint
);

CREATE TABLE review_cycle_notification_recipients (
id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
employee_id bigint,
discarded_at timestamp without time zone,
review_cycle_id bigint,
review_cycle_phase_id bigint,
review_cycle_notification_id bigint
);

CREATE TABLE review_cycle_notifications (
id bigint,
run_at timestamp without time zone,
channel character varying,
task_type character varying,
created_at timestamp without time zone,
updated_at timestamp without time zone,
discarded_at timestamp without time zone,
review_cycle_id bigint,
task_executed_at timestamp without time zone,
review_cycle_phase_id bigint
);

CREATE TABLE review_cycle_phases (
id bigint,
name character varying,
end_time timestamp without time zone,
position bigint,
created_at timestamp without time zone,
phase_type character varying,
start_time timestamp without time zone,
updated_at timestamp without time zone,
discarded_at timestamp without time zone,
review_cycle_id bigint
);

CREATE TABLE review_cycle_template_questions (
id bigint,
content character varying,
formula character varying,
position bigint,
alignment character varying,
block_type character varying,
created_at timestamp without time zone,
updated_at timestamp without time zone,
goal_fields character varying,
question_id bigint,
discarded_at timestamp without time zone,
legend_formula character varying,
default_weights character varying,
question_access character varying,
show_goal_progress boolean,
review_cycle_template_id bigint
);

CREATE TABLE review_cycle_templates (
id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
employee_id bigint,
template_id bigint,
discarded_at timestamp without time zone,
reviewer_type_id bigint,
employee_attribute character varying
);

CREATE TABLE review_cycles (
id bigint,
title character varying,
status character varying,
account_id bigint,
created_at timestamp without time zone,
creator_id bigint,
start_date timestamp without time zone,
updated_at timestamp without time zone,
archived_at timestamp without time zone,
gsheet_info character varying,
discarded_at timestamp without time zone,
last_synced_at timestamp without time zone,
charts_metadata character varying,
duplicated_from bigint,
show_key_results boolean,
anonymize_reports boolean,
review_cycle_phase character varying,
auto_progress_manager boolean,
auto_create_one_on_one character varying,
auto_progress_employee character varying,
competency_config_json character varying,
view_unsubmitted_reviews boolean,
template_employee_attribute character varying,
review_type character varying
);

CREATE TABLE review_responses (
id bigint,
score numeric(38,9),
goal_id bigint,
option_id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
question_id bigint,
reviewee_id bigint,
reviewer_id bigint,
discarded_at timestamp without time zone,
calibrator_id bigint,
response_text character varying,
review_cycle_id bigint,
calibrated_score numeric(38,9),
reviewee_employee_id bigint,
reviewer_employee_id bigint,
reviewee_competency_id bigint,
calibrated_response_text character varying,
calibrated_score_option_id bigint,
review_cycle_template_question_id bigint,
template_question_id bigint
);

CREATE TABLE reviewee_competencies (
id bigint,
exclude boolean,
weightage numeric(38,9),
created_at timestamp without time zone,
updated_at timestamp without time zone,
approver_id bigint,
description character varying,
reviewee_id bigint,
discarded_at timestamp without time zone,
competency_id bigint,
rejected_by_id bigint,
competency_name character varying,
review_cycle_id bigint,
competency_theme_id bigint,
competency_theme_name character varying
);

CREATE TABLE reviewee_goals (
id bigint,
exclude boolean,
goal_id bigint,
weightage numeric(38,9),
created_at timestamp without time zone,
updated_at timestamp without time zone,
approver_id bigint,
reviewee_id bigint,
discarded_at timestamp without time zone,
rejected_by_id bigint,
review_cycle_id bigint
);

CREATE TABLE reviewees (
id bigint,
created_at timestamp without time zone,
manager_id bigint,
updated_at timestamp without time zone,
employee_id bigint,
confidential boolean,
discarded_at timestamp without time zone,
one_on_one_id bigint,
review_cycle_id bigint,
custom_attribute character varying,
custom_variables character varying,
self_review_done boolean,
goal_approval_done boolean,
peer_approval_done boolean,
goal_selection_done boolean,
peer_selection_done boolean,
release_review_done boolean,
manager_summary_done boolean,
review_writing_percent numeric(38,9),
competency_approval_done boolean,
competency_selection_done boolean
);

CREATE TABLE reviewer_types (
id bigint,
autofill boolean,
created_at timestamp without time zone,
updated_at timestamp without time zone,
define_goals boolean,
discarded_at timestamp without time zone,
first_person character varying,
include_goals boolean,
max_reviewers bigint,
min_reviewers bigint,
reviewer_type character varying,
second_person character varying,
review_cycle_id bigint,
can_read_reviews boolean,
approval_required boolean,
define_competency boolean,
include_competency boolean,
define_goal_weights boolean,
nomination_required boolean,
limit_to_participants boolean,
goal_approval_required boolean,
define_competency_weights boolean,
include_in_release_review bigint,
competency_approval_required boolean
);

CREATE TABLE reviewers (
id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
approver_id bigint,
employee_id bigint,
reviewee_id bigint,
discarded_at timestamp without time zone,
nominator_id bigint,
rejected_by_id bigint,
review_cycle_id bigint,
review_submitted boolean,
reviewer_type_id bigint
);

CREATE TABLE schedule_questions (
id bigint,
position bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
question_id bigint,
schedule_id bigint,
is_library_question boolean,
is_manager_question boolean
);

CREATE TABLE schedule_respondents (
id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
schedule_id bigint,
respondent_id bigint
);

CREATE TABLE schedule_templates (
id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
schedule_id bigint,
template_id bigint
);

CREATE TABLE schedules (
id bigint,
title character varying,
status character varying,
subject character varying,
end_date timestamp without time zone,
position bigint,
frequency character varying,
task_type character varying,
account_id bigint,
created_at timestamp without time zone,
cycle_year bigint,
send_email boolean,
start_date timestamp without time zone,
updated_at timestamp without time zone,
visibility bigint,
enps_active boolean,
when_to_run timestamp without time zone,
discarded_at timestamp without time zone,
scheduled_at timestamp without time zone,
cycle_quarter bigint,
email_content character varying,
task_executed boolean,
enps_frequency character varying,
life_cycle_days bigint,
next_pulse_size bigint,
identified_survey boolean,
life_cycle_subset character varying,
default_pulse_size bigint,
parent_schedule_id bigint,
schedule_creator_id bigint,
life_cycle_attribute character varying,
manager_email_content character varying,
manager_email_subject character varying,
send_to_personal_email boolean,
send_slack_notification boolean,
low_rating_comment_required boolean,
auto_add_participants_when_live boolean
);

CREATE TABLE super_list_items (
id BIGSERIAL PRIMARY KEY,
title text,
position integer,
completed boolean DEFAULT false,
reportee_id bigint,
manager_id bigint,
pulse_response_id bigint,
source integer,
action_type integer,
shared boolean DEFAULT false,
created_at timestamp without time zone NOT NULL,
updated_at timestamp without time zone NOT NULL,
status integer,
item_type integer,
one_on_one_note_id bigint,
check_list_item_id character varying(255) DEFAULT NULL::character varying,
send_reminder_on timestamp without time zone
);

CREATE TABLE tasks (
id bigint,
title character varying,
due_date timestamp without time zone,
owner_id bigint,
completed boolean,
created_at timestamp without time zone,
project_id bigint,
start_date timestamp without time zone,
updated_at timestamp without time zone,
added_by_id bigint,
discarded_at timestamp without time zone,
goal_cycle_id bigint
);

CREATE TABLE users (
id bigint,
role bigint,
email character varying,
api_token character varying,
uniq_code character varying,
bypass_sso boolean,
created_at timestamp without time zone,
updated_at timestamp without time zone,
login_count bigint,
self_signed_up boolean,
password_digest character varying
);