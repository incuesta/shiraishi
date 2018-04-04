# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




############################################### Video Tutorials



# Destroy all first
Video.destroy_all





# Admin Registration
Video.create(video_id: "261949242", host: "vimeo", title: "Admin Registration", description: "Admin Registration", position: 1, tags: "registration")

# Loan Manager Registration
Video.create(video_id: "262998934", host: "vimeo", title: "Loan Manager Registration", description: "Loan Manager Registration", position: 2, tags: "registration")

# Accountant Registration
Video.create(video_id: "263001319", host: "vimeo", title: "Accountant Registration", description: "Accountant Registration", position: 3, tags: "registration")

# Client Registration
Video.create(video_id: "263001901", host: "vimeo", title: "Client Registration", description: "Client Registration", position: 4, tags: "registration")




# Activty Logs
Video.create(video_id: "263090638", host: "vimeo", title: "Tracking User Activity", description: "Tracking User Activity", position: 5, tags: "user")

# Client Account Deactivation
Video.create(video_id: "263091074", host: "vimeo", title: "Client Account Deactivation", description: "Client Account Deactivation", position: 6, tags: "user")



# Loan Type Definition
Video.create(video_id: "263091741", host: "vimeo", title: "Defining Loan Types", description: "Defining Loan Types", position: 7, tags: "loans")

# Loan Doc Definition
Video.create(video_id: "263092164", host: "vimeo", title: "Defining Required Documents", description: "Defining Loan Docs", position: 8, tags: "loans")


# Loan Request
Video.create(video_id: "263093402", host: "vimeo", title: "Requesting a Loan Service", description: "Requesting Loans", position: 9, tags: "loans")


# Loan Approval and Disbursion
Video.create(video_id: "263094123", host: "vimeo", title: "Approving Loans and Loan Disbursion", description: "Loan Approval and Disbursion", position: 10, tags: "loans")


# Accounting Entries
Video.create(video_id: "263094634", host: "vimeo", title: "Accounting Entries", description: "Accounting Entries", position: 11, tags: "accounting")





# Articles
Video.create(video_id: "263095460", host: "vimeo", title: "Posting Articles or News", description: "Posting Articles or News", position: 12, tags: "articles")

# Reports
Video.create(video_id: "263096085", host: "vimeo", title: "Generating Reports", description: "Generating Reports", position: 13, tags: "reports")






# Scheduled Backups
Video.create(video_id: "263096688", host: "vimeo", title: "Scheduled Backups", description: "Scheduled Backups", position: 14, tags: "backups")

# Heroku CLI Backups
Video.create(video_id: "263098254", host: "vimeo", title: "Backup using Heroku CLI Backup", description: "Heroku CLI Backup", position: 15, tags: "backups")

# Manual Backups
Video.create(video_id: "263098830", host: "vimeo", title: "Manual Backups", description: "Manual Backups", position: 16, tags: "backups")




# Client Inquiries
Video.create(video_id: "263105990", host: "vimeo", title: "Answering Client Inquiries", description: "Client Inquiries", position: 17, tags: "inquiries")
