require 'game'

describe 'Game' do
  # Напишем два теста:
  #
  # * игрa с успешным результатом
  # * игрa с проигрышем
  #
  # Чтобы протестировать какую-то сложную ситуацию, нам нужно сделать сразу
  # несколько действий с нашим классом. В нашем случае, мы загадаем слово и
  # сделаем несколько правильных ходов с помощью метода next_step.

  # Тест на случай игры, где игрок выигрывает без единой ошибки
  it 'user wins the game' do
    game = Game.new('слово')

    expect(game.status).to eq :in_progress

    game.next_step 'с'
    game.next_step 'о'
    game.next_step 'в'
    game.next_step 'л'

    expect(game.errors).to eq 0
    expect(game.status).to eq :won
  end

  # Тест на случай игры, где игрок проигрывает
  it 'user loses the game' do

    game = Game.new('астма')

    game.next_step 'г'
    game.next_step 'р'
    game.next_step 'п'
    game.next_step 'у'
    game.next_step 'т'
    game.next_step 'о'
    game.next_step 'х'
    game.next_step 'н'

    expect(game.errors).to eq 7
    expect(game.status).to eq :lost
  end
end