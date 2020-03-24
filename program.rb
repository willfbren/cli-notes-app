require_relative './config/environment.rb'

welcome = Artii::Base.new :font => 'slant'
puts welcome.asciify('DONE.')
puts "Welcome to DONE -> A basic CLI note/task manager"
prompt = TTY::Prompt.new

user_name = prompt.ask("Please enter your name:")

existing_user = User.where({name: user_name})
if existing_user.length == 0 
    current_user = User.create({name: user_name})
    puts "This is a new user."
else
    current_user = existing_user[0]
    puts "Welcome back, #{user_name}"
end

user_choice = prompt.select('What would you like to do?', [
    'Create new note',
])

# Creates a new note

if user_choice == 'Create new note'
    note_content = prompt.ask("Please enter your note information:")
    note_due_date = prompt.select("Does this note have a due date?", [
        "Yes",
        "No"
    ])
    if note_due_date == "Yes"
        note_due_date = prompt.ask("Please enter the due date:")
    elsif note_due_date == "No"
        note_due_date = nil
    end
    note_priority = prompt.select("Please select the priority:", [
        "High",
        "Medium",
        "Low"
    ])
    Note.create(content: note_content, due_date: note_due_date, priority: note_priority, is_done: false, user_id: current_user.id)
end

# User enters name 
### if user does not exist, create new user
### if user exists, load user from db
# User selects from a list of options
# Prompt = What would you like to do? View all notes, view categories, create new note, edit existing note, 