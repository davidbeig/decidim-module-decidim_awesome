# frozen_string_literal: true

require "decidim/core/test/factories"
require "decidim/proposals/test/factories"

FactoryBot.define do
  factory :awesome_config, class: "Decidim::DecidimAwesome::AwesomeConfig" do
    var { Faker::Hacker.noun }
    value { Decidim::DecidimAwesome.config.to_a.sample(1).to_h }
    organization { create :organization }
  end

  factory :config_constraint, class: "Decidim::DecidimAwesome::ConfigConstraint" do
    settings { { Faker::Hacker.noun => Faker::Hacker.noun } }
    awesome_config { create :awesome_config }
  end

  factory :editor_image, class: "Decidim::DecidimAwesome::EditorImage" do
    image { Faker::Hacker.noun }
    path { Faker::Internet.url(host: "", scheme: "") }
    author { create :user }
    organization { create :organization }
  end
end
