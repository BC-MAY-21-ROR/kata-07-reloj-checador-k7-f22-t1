# frozen_string_literal: true

json.partial! 'branches/branch', branch: @branch
json.partial! 'branches/attendance', branch: @attendance
json.partial! 'branches/attendance_by_month', branch: @attendance_by_month
json.partial! 'branches/absence_by_month', branch: @absence_by_month
