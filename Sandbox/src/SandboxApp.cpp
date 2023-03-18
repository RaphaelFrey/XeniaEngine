#include <Xenia.h>

#include "imgui/imgui.h"

class ExampleLayer : public Xenia::Layer
{
public:
	ExampleLayer() : Layer("Example")
	{
		
	}
	
	void OnUpdate() override
	{
		if (Xenia::Input::IsKeyPressed(XN_KEY_TAB))
			XN_TRACE("Tab key is pressed (poll)!");
	}

	void OnImGuiRender() override
	{
		ImGui::Begin("Test");
		ImGui::Text("Hello World");
		ImGui::End();
	}

	void OnEvent(Xenia::Event& event) override
	{
		if (event.GetEventType() == Xenia::EventType::KeyPressed)
		{
			Xenia::KeyPressedEvent& e = (Xenia::KeyPressedEvent&)event;
			if (e.GetKeyCode() == XN_KEY_TAB)
				XN_TRACE("Tab key is pressed (event)!");
			XN_TRACE("{0}", (char)e.GetKeyCode());
		}
	}
};


class Sandbox : public Xenia::Application {
public:
	Sandbox()
	{
		PushLayer(new ExampleLayer());
	}

	~Sandbox()
	{

	}
};

Xenia::Application* Xenia::CreateApplication()
{
	return new Sandbox();
}