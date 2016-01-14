import UIKit

class ViewController: UITableViewController {
	
	let animalNames: [String] = ["Duck", "Goose", "Chicken", "Bear", "Whale", "Pig", "Cow", "Cat", "Dog", "Butterfly", "Dolphin", "Bird", "Leopard", "Panther", "Lion", "Tiger"]
	
	// MARK: - UITableViewDataSource
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return animalNames.count
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
		let animalName = animalNames[indexPath.row]
		cell.textLabel?.text = animalName
		return cell
	}
	
	// MARK: - UITableViewDelegate
	
	var selectedCellIndexPath: NSIndexPath?
	
	let selectedCellHeight: CGFloat = 88.0
	let unselectedCellHeight: CGFloat = 44.0
	
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		if selectedCellIndexPath != nil && selectedCellIndexPath == indexPath {
			// When the selected cell gets tapped, deselect it
			tableView.deselectRowAtIndexPath(indexPath, animated: true)
			selectedCellIndexPath = nil
		} else {
			selectedCellIndexPath = indexPath
		}
		
		// These two calls makes the cell animate to its new height
		tableView.beginUpdates()
		tableView.endUpdates()
		
		if selectedCellIndexPath != nil {
			// This ensures, that the cell is fully visible once expanded
			tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: .None, animated: true)
		}
	}
	
	override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		if selectedCellIndexPath == indexPath {
			return selectedCellHeight
		}
		return unselectedCellHeight
	}
	
}

