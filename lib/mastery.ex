defmodule Mastery do
  alias Mastery.Boundary.QuizManager
  alias Mastery.Boundary.QuizSession
  alias Mastery.Boundary.QuizValidator
  alias Mastery.Boundary.TemplateValidator
  alias Mastery.Core.Quiz

  def build_quiz(fields) do
    with :ok <- QuizValidator.errors(fields),
         :ok <- GenServer.call(QuizManager, {:build_quiz, fields}),
         do: :ok,
         else: (error -> error)
  end

  def add_template(title, fields) do
    with :ok <- TemplateValidator.errors(fields),
         :ok <- GenServer.call(QuizManager, {:add_template, title, fields}),
         do: :ok,
         else: (error -> error)
  end

  def take_quiz(title, email) do
    with %Quiz{} = quiz <- QuizManager.lookup_quiz_by_title(title),
         {:ok, _} <- QuizSession.take_quiz(quiz, email),
         do: {title, email},
         else: (error -> error)
  end

  def select_question(session) do
    GenServer.call(QuizSession.via(session), :select_question)
  end

  def answer_question(session, answer) do
    GenServer.call(QuizSession.via(session), {:answer_question, answer})
  end
end
