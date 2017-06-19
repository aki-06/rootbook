require 'test_helper'

class TextTest < Test::Unit::TestCase
  def test_word
    assert Yoshida::Text.word.length >= 1
    assert_equal String, Yoshida::Text.word.class
  end
  
  def test_words
    assert Yoshida::Text.words.length >= 2
    assert_equal Array, Yoshida::Text.words.class
  end
  
  def test_sentence
    assert Yoshida::Text.sentence.length >= 2
    assert_equal String, Yoshida::Text.sentence.class
  end
  
  def test_sentences
    assert Yoshida::Text.sentences.length >= 2
    assert_equal Array, Yoshida::Text.sentences.class
  end
end