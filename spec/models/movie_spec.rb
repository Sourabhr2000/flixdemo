require 'rails_helper'


RSpec.describe Movie, type: :model do

  describe 'Validations-' do


    # test title validation
    context 'When movie title presence' do 
        it 'should return true ' do
            movie=Movie.new(title:"big bull",released_on:"12-08-2021",duration:"3",
                description:"this is only for testing .. we are checking movie validation with rspec",
                total_gross:23999,image_file_name:"test.jpg",rating:"R").save
            expect(movie).to eq(true)  
        end
    end
    
    context 'When movie title is not presence' do 
        it 'should return false ' do
            movie=Movie.new(released_on:"12-08-2021",duration:"3",
                description:"this is only for testing .. we are checking movie validation with rspec",
                total_gross:23999,image_file_name:"test.jpg",rating:"R").save
            expect(movie).to eq(false)
        end
    end

    # test released_on validation
    context 'When movie released_on is presence' do 
        it 'should return true ' do
            movie=Movie.new(title:"big bull",released_on:"12-08-2021",duration:"3",
                description:"this is only for testing .. we are checking movie validation with rspec",
                total_gross:23999,image_file_name:"test.jpg",rating:"R").save
            expect(movie).to eq(true)  
        end
    end
    
    context 'When movie released_on is not presence' do 
        it 'should return false ' do
            movie=Movie.new(title:"big bull",duration:"3",
                description:"this is only for testing .. we are checking movie validation with rspec",
                total_gross:23999,image_file_name:"test.jpg",rating:"R").save
            expect(movie).to eq(false)
        end
    end


    # test duration validation
    context 'When movie duration is presence' do 
        it 'should return true ' do
            movie=Movie.new(title:"big bull",released_on:"12-08-2021",duration:"3",
                description:"this is only for testing .. we are checking movie validation with rspec",
                total_gross:23999,image_file_name:"test.jpg",rating:"R").save
            expect(movie).to eq(true)  
        end
    end
    
    context 'When movie duration is not presence' do 
        it 'should return false ' do
            movie=Movie.new(title:"big bull",released_on:"12-08-2021",
                description:"this is only for testing .. we are checking movie validation with rspec",
                total_gross:23999,image_file_name:"test.jpg",rating:"R").save
            expect(movie).to eq(false)
        end
    end


    #test description validation
    context 'When movie description is more than 25' do 
        it 'should return true ' do
            movie=Movie.new(title:"big bull",released_on:"12-08-2021",duration:"3",
                description:"this is only for testing .. we are checking movie validation with rspec",
                total_gross:23999,image_file_name:"test.jpg",rating:"R").save
            expect(movie).to eq(true)  
        end
    end
    
    context 'When movie description is less than 25' do 
        it 'should return false ' do
            movie=Movie.new(title:"big bull",released_on:"12-08-2021",duration:"3",
                description:"rspec",
                total_gross:23999,image_file_name:"test.jpg",rating:"R").save
            expect(movie).to eq(false)
        end
    end

     #test total_gross validation
     context 'When movie total_gross is numerical and greated than or equal to 0' do 
        it 'should return true ' do
            movie=Movie.new(title:"big bull",released_on:"12-08-2021",duration:"3",
                description:"this is only for testing .. we are checking movie validation with rspec",
                total_gross:23999,image_file_name:"test.jpg",rating:"R").save
            expect(movie).to eq(true)  
        end
    end
    
    context 'When movie total_gross is not numerical and less than 0' do 
        it 'should return false ' do
            movie=Movie.new(title:"big bull",released_on:"12-08-2021",duration:"3",
                description:"this is only for testing .. we are checking movie validation with rspec",
                total_gross:-1,image_file_name:"test.jpg",rating:"R").save
            expect(movie).to eq(false)
        end
    end


    #test image file name validation
    context 'When movie image_file_name is in jpg or png format' do 
        it 'should return true ' do
            movie=Movie.new(title:"big bull",released_on:"12-08-2021",duration:"3",
                description:"this is only for testing .. we are checking movie validation with rspec",
                total_gross:23999,image_file_name:"test.jpg",rating:"R").save
            expect(movie).to eq(true)  
        end
    end
    
    context 'When movie image_file_name is not in jpg or png format' do 
        it 'should return false ' do
            movie=Movie.new(title:"big bull",released_on:"12-08-2021",duration:"3",
                description:"this is only for testing .. we are checking movie validation with rspec",
                total_gross:6577,image_file_name:"test",rating:"R").save
            expect(movie).to eq(false)
        end
    end


    #test rating validation
    context 'When movie rating is in (G PG PG-13 R NC-17)' do 
        it 'should return true ' do
            movie=Movie.new(title:"big bull",released_on:"12-08-2021",duration:"3",
                description:"this is only for testing .. we are checking movie validation with rspec",
                total_gross:23999,image_file_name:"test.jpg",rating:"R").save
            expect(movie).to eq(true)  
        end
    end
    
    context 'When movie rating is not in (G PG PG-13 R NC-17)' do 
        it 'should return false ' do
            movie=Movie.new(title:"big bull",released_on:"12-08-2021",duration:"3",
                description:"this is only for testing .. we are checking movie validation with rspec",
                total_gross:6577,image_file_name:"test",rating:"kl").save
            expect(movie).to eq(false)
        end
    end


    # subject {
    #     Movie.new(title:"Er. subh",released_on:"12-08-2021",duration:"3",
    #         description:"this is only for testing .. we are checking movie validation with rspec",
    #         total_gross:6577,image_file_name:"test",rating:"kl")
    #   }
    
    context 'When movie title is not unique' do 
        it 'should return false ' do
            movie=Movie.new(title:"Er. subh",released_on:"12-08-2021",duration:"3",
                description:"this is only for testing .. we are checking movie validation with rspec",
                total_gross:6577,image_file_name:"test",rating:"kl")
            # expect(movie).to eq(false)
            expect(movie).to_not be_valid
        end
    end


    context 'When movie duration is not unique' do 
        it 'should return false ' do
            movie=Movie.new(title:"Er. subhrathore",released_on:"12-08-2021",duration:"4",
                description:"this is only for testing .. we are checking movie validation with rspec",
                total_gross:6577,image_file_name:"test",rating:"kl")
            # expect(movie).to eq(false)
            expect(movie).to_not be_valid
        end
    end


    context 'When movie released_on is not unique' do 
        it 'should return false ' do
            movie=Movie.new(title:"Er. subhrathore",released_on:"09-08-2018",duration:"6",
                description:"this is only for testing .. we are checking movie validation with rspec",
                total_gross:6577,image_file_name:"test",rating:"kl")
            # expect(movie).to eq(false)
            expect(movie).to_not be_valid
        end
    end

    #test has_many validation
    it { should have_many(:reviews).dependent(:destroy) } 
    it { should have_many(:favorites).dependent(:destroy) }
    it { should have_many(:characterizations).dependent(:destroy) } 
    it { should have_many(:fans)} 
    it { should have_many(:genres)} 
  
  end
  
end
