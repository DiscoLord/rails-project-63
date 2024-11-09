# frozen_string_literal: true

# Модель юзера для генерации формы
User = Struct.new(:name, :job, keyword_init: true)