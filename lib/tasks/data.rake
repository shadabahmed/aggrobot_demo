require 'factory_robot/factory_robot'

namespace :data do
  task :create => %w[db:drop db:create db:migrate] do
    FactoryRobot.start(:scores) do
      count 400
      name ['Sachin Tendulkar']
      score ->(x){
        case x
          when  0..10 then rand(200..238)
          when  10..50 then rand(100..199)
          else rand(0..99)
        end
      }
      not_out 2 => 'true', 10 => 'false'
      venue 2 => 'Neutral', 7 => 'Home', 10 => 'Away'
      against ->(x){
        case rand
          when 0..0.85
            ['Pakistan', 'Australia', 'South Africa', 'England', 'Sri Lanka'].sample
          else
            ['Bangladesh', 'Zimbabwe'].sample
        end
      }
      match_result ->(x){
        case rand
          when 0..0.50
            'Won'
          else
            'False'
        end
      }
    end

    FactoryRobot.start(:scores) do
      count 400
      name ['Ricky Ponting']
      score ->(x){
        case x
          when  0..10 then rand(200..300)
          when  10..40 then rand(100..199)
          else rand(0..99)
        end
      }
      not_out 2 => 'true', 10 => 'false'
      venue 2 => 'Neutral', 6 => 'Home', 10 => 'Away'
      against ->(x){
        case rand
          when 0..0.90
            ['Pakistan', 'India', 'South Africa', 'England', 'Sri Lanka'].sample
          else
            ['Bangladesh', 'Zimbabwe'].sample
        end
      }
      match_result ->(x){
        case rand
          when 0..0.80
            'Won'
          else
            'False'
        end
      }
    end
  end
end