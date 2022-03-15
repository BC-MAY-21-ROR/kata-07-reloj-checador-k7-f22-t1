# frozen_string_literal: true

json.array! @branches, partial: 'branches/branch', as: :branch
