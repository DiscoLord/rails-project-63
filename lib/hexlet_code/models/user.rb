# frozen_string_literal: true

# Модель юзера для генерации формы
User = Struct.new(:name, :job, :gender, keyword_init: true)
