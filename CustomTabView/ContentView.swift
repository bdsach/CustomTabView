//
//  ContentView.swift
//  CustomTabView
//
//  Created by Bandit Silachai on 17/1/24.
//
import SwiftUI

struct ContentView: View {

    @State private var selectedTab = 0

    var body: some View {
        TabView {
            VStack(spacing: 0) {
                switch selectedTab {
                case 0:
                    Text("Home")
                        .font(.largeTitle.bold())
                case 1:
                    Text("Search")
                        .font(.largeTitle.bold())
                case 2:
                    Text("Setting")
                        .font(.largeTitle.bold())
                default:
                    EmptyView()
                }
            }
        }
        .overlay(alignment: .bottom) {
            CustomTabBar(selectedTab: $selectedTab)
        }

    }
}

#Preview {
   ContentView()
}

struct CustomTabBar: View {
    @Binding var selectedTab: Int

    var body: some View {
        HStack() {
            Spacer()
            TabBarButton(tabIndex: 0, systemImageName: "house.fill", tabTitle: "Home", selectedTab: $selectedTab)
            Spacer()
            TabBarButton(tabIndex: 1, systemImageName: "magnifyingglass", tabTitle: "Search", selectedTab: $selectedTab)
            Spacer()
            TabBarButton(tabIndex: 2, systemImageName: "gear", tabTitle: "Setting", selectedTab: $selectedTab)
            Spacer()
        }
        .padding()
        .background(.thickMaterial)
        .clipShape(Capsule())
        .padding(.horizontal)
        .shadow(color: .gray.opacity(0.3), radius: 8, x: 5.0, y: 5.0)
    }
}

struct TabBarButton: View {
    let tabIndex: Int
    let systemImageName: String
    let tabTitle: String
    @Binding var selectedTab: Int

    var body: some View {
        Button(action: {
            withAnimation(.spring) {
                selectedTab = tabIndex
            }
        }) {
            VStack {
                Image(systemName: systemImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: selectedTab == tabIndex ? 28 : 24,
                           height: selectedTab == tabIndex ? 28 : 24)
                    .foregroundColor(selectedTab == tabIndex ? .black : .gray)
                Text(tabTitle)
                    .font(.caption)
                    .fontWeight(selectedTab == tabIndex ? .medium : .regular)
                    .foregroundColor(selectedTab == tabIndex ? .black : .gray)
            }
        }
        .buttonStyle(.plain)
        .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .center)
    }
}
